import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_center/domain/use_case/all_game_usecase.dart';
import 'package:game_center/models/game_center/all_game_model.dart';
import 'package:injectable/injectable.dart';

part 'list_all_game_state.dart';

const LIMIT = 10;

@injectable
class ListAllGameCubit extends Cubit<ListAllGameState> {
  ///use case
  final AllGameUseCase _allGameUseCase;
  List<GameModel> games = [];
  int gamePage = 1;
  int gamePageCount = 1;
  ValueNotifier<int> gameCount = ValueNotifier(0);

  ListAllGameCubit(
    this._allGameUseCase,
  ) : super(ListGameInitState()) {
    init();
  }

  init() {
    _getListAllGame();
  }

  _getListAllGame({
    bool isRefresh = false,
    isLoadMore = false,
  }) async {
    if (!isRefresh && !isLoadMore) emit(LoadingState());
    if (!isLoadMore) games.clear();
    final result = await _allGameUseCase.getAllGame(
      page: gamePage,
      limit: LIMIT,
    );

    games.addAll(result?.games ?? []);
    gameCount.value = result?.itemCount ?? 0;
    gamePageCount = result?.pageCount ?? 1;
    emit(GetDataListGameSuccess(
      listGames: games,
    ));
  }

  loadMoreGame() async {
    if (gamePage >= gamePageCount) {

      return;
    }
    gamePage++;
    await _getListAllGame(
      isLoadMore: true,
    );
  }
}
