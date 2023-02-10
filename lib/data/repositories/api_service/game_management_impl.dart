import 'package:game_center/constant/constant_game_center.dart';
import 'package:game_center/data/data_source/service/game_system.dart';
import 'package:game_center/data/repositories/local_repositories/local/acc_local_db.dart';
import 'package:game_center/domain/repositories/api_service/game_management_repository.dart';
import 'package:game_center/models/game_center/all_game_model.dart';
import 'package:game_center/models/game_center/game_dashboard_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GameManagementRepository)
class GameManagementImpl implements GameManagementRepository {
  final GameSystem gameSystemService;
  final AccLocalDatabase accLocalDatabase;

  GameManagementImpl(this.gameSystemService, this.accLocalDatabase);

  @override
  Future<AllGamesModel?> getAllGame({
    int? limit,
    int? page,
    String? type,
  }) async {
    final res = await gameSystemService.getAllGames(
      limit: limit,
      page: page,
      type: type,
    );

    return Future.value(res.data);
  }

  @override
  Future<GameDashboardModel> getGameDashboard() async {
    final res = await gameSystemService.getGameDashboard();

    return Future.value(res.data);
  }

  @override
  Future<AllGamesModel?> getGameAdvertisements({
    int? limit,
    int? page,
    int? id,
    String? state,
  }) async {
    final res = await gameSystemService.getAllGames(
      limit: limit,
      page: page,
      type: TypeGame.hot.name,
    );

    return res.data;
  }
}

enum TypeGame { campaign, hot }
