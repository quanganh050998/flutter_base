import 'package:game_center/domain/repositories/api_service/game_management_repository.dart';
import 'package:game_center/domain/repositories/firebase_config_repository.dart';
import 'package:game_center/models/game_center/all_game_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class AllGameUseCase {
  final GameManagementRepository _gameManagementRepo;
  final FirebaseConfigRepository _firebaseConfigRepository;

  AllGameUseCase(this._gameManagementRepo, this._firebaseConfigRepository,);

  Future<AllGamesModel?> getAllGame({
    int? limit,
    int? page,
    String? type,
  }) async {
    try{
      return await _gameManagementRepo.getAllGame(
        limit: limit,
        page: page,
        type: type,
      );
    }catch(e){
      final dataAllGame = await _firebaseConfigRepository.getAllGame();
      if (dataAllGame != null && dataAllGame is Map<String, dynamic>) {
        return AllGamesModel.fromJson(dataAllGame);
      }
    }
  }
}