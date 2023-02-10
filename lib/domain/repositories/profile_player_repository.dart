import 'package:game_center/models/game_center/profile_player_model.dart';

abstract class ProfilePlayerRepository {
  Future<void> insertAccount(
    ProfilePlayerModel profilePlayerModel,
  );

  Future<List<ProfilePlayerModel>> getPlayerProfile();

  Future<dynamic> updateAccounts({
    int id = 0,
    required String name,
    required String age,
    required String description,
    required String phone,
  });

  Future<void> deleteAcc();
}
