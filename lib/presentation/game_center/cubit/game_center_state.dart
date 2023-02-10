part of 'game_center_cubit.dart';

@immutable
abstract class GameCenterState {}

class GameCenterInitial extends GameCenterState {}

class LoadingDataDashBoard extends GameCenterState {}

class LoadingAvatar extends GameCenterState {}

class ChangeAppBarState extends GameCenterState {}

class GetDataStartGame extends GameCenterState {
  final GameDashboardModel gameDashboardModel;
  final List<GameModel> listModel;
  final List<GameModel> allGames;

  GetDataStartGame({
    required this.gameDashboardModel,
    required this.listModel,
    required this.allGames,
  });
}

class LoadingStartGame extends GameCenterState {}

class GetDataBannerSuccess extends GameCenterState {
  final List<GameModel> listModel;

  GetDataBannerSuccess({required this.listModel});
}

class SetPaddingBodyGameCenter extends GameCenterState {
  final double paddingBody;

  SetPaddingBodyGameCenter({required this.paddingBody});
}
