import 'dart:async';

import 'package:game_center/constant/constant_game_center.dart';
import 'package:game_center/domain/repositories/socket_mapping.dart';
import 'package:game_center/network/core_socket.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SocketMapping)
class SocketRepoImpl extends SocketMapping{
  final CoreSocket _coreSocket;

  SocketRepoImpl(this._coreSocket);

  @override
  Stream<double> updateMarkPrice() {
    const String room = 'futures@$defaultSymbol';

    return _coreSocket.join(room, EventType.markPriceUpdate).transform(
      StreamTransformer<Map<String, dynamic>, double>.fromHandlers(
        handleData: (data, sink) {
          if (data.isNotEmpty) {
            final listTrade = data['payload'] as Map<String,dynamic>;
            if(listTrade['symbol'] == defaultSymbol){
              sink.add(listTrade['mark_price']);
            }
          }
        },
      ),
    );
  }
}