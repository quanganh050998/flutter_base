import 'package:game_center/constant/constant_game_center.dart';
import 'package:game_center/domain/repositories/api_service/game_management_repository.dart';
import 'package:game_center/domain/repositories/firebase_config_repository.dart';
import 'package:game_center/models/game_center/all_game_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class ListHotGameUseCase {
  final GameManagementRepository _gameManagementRepo;
  final FirebaseConfigRepository _firebaseConfigRepository;

  ListHotGameUseCase(this._gameManagementRepo, this._firebaseConfigRepository);

  Future<List<GameModel>> getListHotGame() async {
    try{
      final data = await _gameManagementRepo.getGameAdvertisements();

      return data?.games ?? [];
    }catch(e){
      final hotGame = await _firebaseConfigRepository.getHotGame();
      if (hotGame != null && hotGame is Map<String, dynamic>) {
        print('+++++++------------ $hotGame');
      }

      return dataHotGameDefault;
    }
  }
}
