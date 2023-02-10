import 'package:game_center/data/repositories/local_repositories/local/acc_local_db.dart';
import 'package:game_center/di/di.dart';

mixin LocalDB {
  static Future<void> initLocalDB() async {
    await configDB();
  }

  static Future<void> configDB() async {
    final db = await $FloorAccLocalDatabase
        .databaseBuilder('game_canter_local_db.db')
        .build();

    getIt.registerSingleton<AccLocalDatabase>(db);
  }
}