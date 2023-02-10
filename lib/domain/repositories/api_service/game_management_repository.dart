import 'package:game_center/models/game_center/all_game_model.dart';
import 'package:game_center/models/game_center/game_dashboard_model.dart';

abstract class GameManagementRepository {
  Future<AllGamesModel?> getAllGame({
    int? limit,
    int? page,
    String? type,
  });

  Future<GameDashboardModel> getGameDashboard();

  Future<AllGamesModel?> getGameAdvertisements({
    int? limit,
    int? page,
    int? id,
    String? state,
  });
}
