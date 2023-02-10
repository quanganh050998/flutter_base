part of 'player_profile_cubit.dart';

@immutable
abstract class PlayerProfileState {}

class PlayerProfileInitial extends PlayerProfileState {}

class PlayerProfileLoading extends PlayerProfileState {}

class PlayerProfileFail extends PlayerProfileState {}

class GetPlayerProfileSuccess extends PlayerProfileState {
  final ProfilePlayerModel? gamePlayer;
  final List<GameModel> games;

  GetPlayerProfileSuccess({
    required this.gamePlayer,
    required this.games,
  });
}

class UpdateMarkPriceSuccess extends PlayerProfileState{
  final double markPrice;

  UpdateMarkPriceSuccess({required this.markPrice});
}