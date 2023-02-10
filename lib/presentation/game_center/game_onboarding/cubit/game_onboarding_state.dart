part of 'game_onboarding_cubit.dart';

@immutable
abstract class GameOnBoardingState {}

class GameOnBoardingInitState extends GameOnBoardingState {}

class ChangeAppBarState extends GameOnBoardingState {
  final double offset;

  ChangeAppBarState(this.offset);
}

class DataDashBoardState extends GameOnBoardingState {
  final GameDashboardModel gameDashboardModel;

  DataDashBoardState({required this.gameDashboardModel});
}
