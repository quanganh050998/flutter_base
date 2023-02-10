import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_center/domain/use_case/data_dash_board_usecase.dart';
import 'package:game_center/models/game_center/game_dashboard_model.dart';
import 'package:injectable/injectable.dart';

part 'game_onboarding_state.dart';

@injectable
class GameOnBoardingCubit extends Cubit<GameOnBoardingState> {
  ///use case
  final DataDashBoardUseCase _dataDashBoardUseCase;

  GameOnBoardingCubit(
    this._dataDashBoardUseCase,
  ) : super(GameOnBoardingInitState()) {
    init();
  }

  init() {
    getDataDashBoard();
  }

  Future<void> getDataDashBoard() async {
    final dataDashBoard = await _dataDashBoardUseCase.getDataDashBoard();
    emit(DataDashBoardState(gameDashboardModel: dataDashBoard));
  }

  changeAppBarState(double offset) {
    if (offset < 255) {
      emit(ChangeAppBarState(0));
    } else {
      emit(ChangeAppBarState(offset - 255));
    }
  }
}
