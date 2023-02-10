import 'dart:async';

import 'package:floor/floor.dart';
import 'package:game_center/data/repositories/local_repositories/local/database_profile.dart';
import 'package:game_center/models/game_center/profile_player_model.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'acc_local_db.g.dart';

@Database(version: 1, entities: [
  ProfilePlayerModel,
])

abstract class AccLocalDatabase extends FloorDatabase {
  PlayerProfileDao get accountDao;
}