import 'package:floor/floor.dart';
import 'package:game_center/models/game_center/profile_player_model.dart';

@dao
abstract class PlayerProfileDao {
  @Query('SELECT * FROM profile_player')
  Future<List<ProfilePlayerModel>> getPlayerProfile();

  @insert
  Future<int> insertAccount(ProfilePlayerModel profilePlayerModel);

  @Query('SELECT * FROM profile_player WHERE id=:id')
  Future<ProfilePlayerModel?> getAccount(int id);

  @Query('DELETE FROM profile_player')
  Future<void> deleteAccount();

  @Query(
      'UPDATE profile_player SET name =:name, age =:age,description =:description,phone =:phone WHERE id=:id')
  Future<ProfilePlayerModel?> updateAccounts(
    int id,
    String name,
    String age,
    String description,
    String phone,
  );
}
