import 'package:injectable/injectable.dart';
import 'package:socket_io_client/socket_io_client.dart';

@module
abstract class SocketModule {
  @singleton
  Socket get socketIO {
    return io(
      'wss://ws.position.exchange',
      OptionBuilder().setTransports(['websocket']).build(),
    );
  }
}
