import 'package:game_center/domain/repositories/api_service/game_management_repository.dart';
import 'package:game_center/domain/repositories/profile_player_repository.dart';
import 'package:game_center/models/game_center/profile_player_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class PlayerProfileUseCase {
  final GameManagementRepository gameManagementRepo;
  final ProfilePlayerRepository profilePlayerRepository;

  PlayerProfileUseCase(
    this.gameManagementRepo,
    this.profilePlayerRepository,
  );

  Future<List<ProfilePlayerModel>> insertAccount(
    ProfilePlayerModel profilePlayerModel,
  ) async {
    await profilePlayerRepository.insertAccount(profilePlayerModel);

    return await getPlayerProfile();
  }

  Future<List<ProfilePlayerModel>> getPlayerProfile() async {
    return await profilePlayerRepository.getPlayerProfile();
  }

  Future<dynamic> updateAcc({
    String? name,
    String? age,
    String? description,
    String? phone,
    int? id,
  }) async {
    final dataProfile = await getPlayerProfile();

    return await profilePlayerRepository.updateAccounts(
      name: name ?? dataProfile.first.name,
      age: age ?? dataProfile.first.age,
      description: description ?? dataProfile.first.description,
      phone: phone ?? dataProfile.first.phone ?? '',
      id: id ?? dataProfile.first.id ?? 1,
    );
  }

  Future<void> deleteData() async {
    return await profilePlayerRepository.deleteAcc();
  }
}
