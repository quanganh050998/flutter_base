import 'package:game_center/data/repositories/local_repositories/local/acc_local_db.dart';
import 'package:game_center/domain/repositories/profile_player_repository.dart';
import 'package:game_center/models/game_center/profile_player_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfilePlayerRepository)
class ProfilePlayerImp implements ProfilePlayerRepository {
  final AccLocalDatabase accLocalDatabase;

  ProfilePlayerImp(
    this.accLocalDatabase,
  );

  @override
  Future<void> insertAccount(
    ProfilePlayerModel profilePlayerModel,
  ) async {
    await accLocalDatabase.accountDao.insertAccount(profilePlayerModel);
  }

  @override
  Future<List<ProfilePlayerModel>> getPlayerProfile() async {
    return (await accLocalDatabase.accountDao.getPlayerProfile());
  }

  @override
  Future<dynamic> updateAccounts({
    int id = 1,
    required String name,
    required String age,
    required String description,
    required String phone,
  }) async {
    return (await accLocalDatabase.accountDao
        .updateAccounts(id, name, age, description, phone));
  }

  @override
  Future<void> deleteAcc() async {
    return (await accLocalDatabase.accountDao.deleteAccount());
  }
}
