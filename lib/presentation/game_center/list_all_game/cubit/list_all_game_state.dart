part of 'list_all_game_cubit.dart';

@immutable
abstract class ListAllGameState {}

class ListGameInitState extends ListAllGameState {}

class LoadingState extends ListAllGameState {}

class GetDataListGameFail extends ListAllGameState {}

class GetDataListGameSuccess extends ListAllGameState {
  final List<GameModel> listGames;

  GetDataListGameSuccess({required this.listGames});
}
