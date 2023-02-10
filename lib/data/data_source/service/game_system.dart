import 'package:game_center/models/common/posi_response.dart';
import 'package:game_center/models/game_center/all_game_model.dart';
import 'package:game_center/models/game_center/game_dashboard_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'game_system.g.dart';

@RestApi()
abstract class GameSystem {
  factory GameSystem(Dio dio, {String baseUrl}) = _GameSystem;

  @GET('/v1/game/campaign')
  Future<PosiResponse<GameModel>> getGameCampaign();

  @GET('/v1/dashboards')
  Future<PosiResponse<GameDashboardModel>> getGameDashboard();

  @GET('/v1/games')
  Future<PosiResponse<AllGamesModel>> getAllGames({
    @Query('limit') int? limit,
    @Query('page') int? page,
    @Query('type') String? type,
  });
}