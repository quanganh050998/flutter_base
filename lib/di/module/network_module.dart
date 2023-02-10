import 'package:dio/dio.dart';
import 'package:game_center/data/data_source/service/game_system.dart';
import 'package:game_center/di/di.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @injectable
  Dio get dio {
    final Dio dio = Dio();

    return dio;
  }

  @injectable
  GameSystem get gameSystem => GameSystem(
        getIt<Dio>(),
        baseUrl: 'https://www.google.com/',
      );
}
