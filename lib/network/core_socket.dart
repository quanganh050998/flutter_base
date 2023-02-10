import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:socket_io_client/socket_io_client.dart';

@singleton
class CoreSocket{
  final Socket _socketIO;
  final Map<String, int> _roomJoint = {};
  final BehaviorSubject<Map<String, dynamic>> _markPriceUpdate = BehaviorSubject();

  CoreSocket({
    required Socket socketIO,
  }) : _socketIO = socketIO {
    _setupSocket();
  }

  void _setupSocket() {
    _socketIO.onConnect((_) {
      for (final element in _roomJoint.keys) {
        if ((_roomJoint[element] ?? 0) > 0) {
          _socketIO.emit('join', element);
        }
      }
    });

    _socketIO.on('markPriceChanged', (data) {
      if (data is Map<String, dynamic>) {
        _markPriceUpdate.add(data);
      }
    });

  }

  Stream<Map<String, dynamic>> join(String room, EventType type) {
    _socketIO.emit('join', room);
    final int currentListenerInRoom = _roomJoint[room] ?? 0;
    _roomJoint[room] = currentListenerInRoom + 1;
    Subject<Map<String, dynamic>> subject;

    switch (type) {
      case EventType.markPriceUpdate:
        subject = _markPriceUpdate;
        break;
    }

    return subject.stream.doOnCancel(() {
      final int currentListenerInRoom = _roomJoint[room] ?? 0;
      if (currentListenerInRoom > 0) {
        _roomJoint[room] = currentListenerInRoom - 1;
      }
      if ((_roomJoint[room] ?? 0) == 0) {
        _socketIO.emit('leave', room);
      }
    });
  }
}

enum EventType {
  markPriceUpdate,
}