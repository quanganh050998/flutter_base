import 'dart:async';
import 'dart:convert';

import 'package:game_center/domain/repositories/firebase_config_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

@Injectable(as: FirebaseConfigRepository)
class FirebaseConfigImp implements FirebaseConfigRepository {
  final FirebaseRemoteConfig remoteConfig;

  FirebaseConfigImp(this.remoteConfig);

  @override
  FutureOr<dynamic> getDashBoard() {
    return remoteConfig.getString('dash_board').isNotEmpty
        ? jsonDecode(remoteConfig.getString('dash_board'))
        : null;
  }

  @override
  FutureOr<dynamic> getAllGame() {
    return remoteConfig.getString('all_game').isNotEmpty
        ? jsonDecode(remoteConfig.getString('all_game'))
        : null;
  }

  @override
  FutureOr<dynamic> getHotGame() {
    return remoteConfig.getString('hot_game').isNotEmpty
        ? jsonDecode(remoteConfig.getString('hot_game'))
        : null;
  }
}