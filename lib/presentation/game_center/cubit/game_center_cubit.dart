import 'package:async/async.dart';
import 'package:bloc/bloc.dart';
import 'package:game_center/domain/use_case/all_game_usecase.dart';
import 'package:game_center/domain/use_case/data_dash_board_usecase.dart';
import 'package:game_center/domain/use_case/list_hot_game_usecase.dart';
import 'package:game_center/models/game_center/all_game_model.dart';
import 'package:game_center/models/game_center/game_dashboard_model.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'game_center_state.dart';

@injectable
class GameCenterCubit extends Cubit<GameCenterState> {
  ///usecase
  final AllGameUseCase _allGameUseCase;
  final DataDashBoardUseCase _dataDashBoardUseCase;
  final ListHotGameUseCase _listHotGameUseCase;

  GameCenterCubit(this._allGameUseCase,this._dataDashBoardUseCase, this._listHotGameUseCase,)
      : super(GameCenterInitial()) {
    onInit();
  }

  void onInit() {
    getDataDashBoard();
  }

  Future<void> getDataDashBoard() async {
    emit(LoadingStartGame());
    FutureGroup futureGroup = FutureGroup();
    futureGroup.add(_dataDashBoardUseCase.getDataDashBoard());
    futureGroup.add(_listHotGameUseCase.getListHotGame());
    futureGroup.add(_allGameUseCase.getAllGame());
    futureGroup.close();
    final asyncData = await futureGroup.future;
    final dataDashBoard = asyncData[0];
    final dataHotGame = asyncData[1];
    final allGames = asyncData[2] as AllGamesModel;

    emit(GetDataStartGame(
      gameDashboardModel: dataDashBoard,
      listModel: dataHotGame,
      allGames: allGames.games,
    ));
  }

  changeAppBarState() {
    emit(ChangeAppBarState());
  }

  void changePaddingBody(double offset) {
    if (offset < 105) {
      emit(SetPaddingBodyGameCenter(paddingBody: 0));
    } else {
      emit(SetPaddingBodyGameCenter(paddingBody: offset - 105));
    }
  }
}
