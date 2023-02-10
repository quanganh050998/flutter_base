import 'package:game_center/constant/constant_game_center.dart';
import 'package:game_center/domain/repositories/api_service/game_management_repository.dart';
import 'package:game_center/domain/repositories/firebase_config_repository.dart';
import 'package:game_center/models/game_center/game_dashboard_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class DataDashBoardUseCase {
  final GameManagementRepository _gameManagementRepo;
  final FirebaseConfigRepository _firebaseConfigRepository;

  DataDashBoardUseCase(this._gameManagementRepo, this._firebaseConfigRepository);

  Future<GameDashboardModel> getDataDashBoard() async {
    try{
      return await _gameManagementRepo.getGameDashboard();
    }catch(e){
      final dataDashBoard = await _firebaseConfigRepository.getDashBoard();
      if (dataDashBoard != null && dataDashBoard is Map<String, dynamic>) {

        return GameDashboardModel.fromJson(dataDashBoard);
      }else{
        return defaultGameDashBoard;
      }
    }
  }
}
