import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:game_center/constant/constant_game_center.dart';
import 'package:game_center/domain/use_case/mark_price_usecase.dart';
import 'package:game_center/domain/use_case/player_profile_usecase.dart';
import 'package:game_center/models/game_center/all_game_model.dart';
import 'package:game_center/models/game_center/profile_player_model.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'player_profile_state.dart';

@injectable
class PlayerProfileCubit extends Cubit<PlayerProfileState> {
  ///user case
  final PlayerProfileUseCase _playerProfileUseCase;
  final MarkPriceUseCase _markPriceUseCase;

  ///val
  StreamSubscription? _streamSubscription;
  ProfilePlayerModel? gamePlayer;
  List<GameModel> games = [];
  String setName = '';
  TextEditingController nameController = TextEditingController();
  int? id;
  StreamSubscription? _markPriceSub;

  PlayerProfileCubit(
    this._playerProfileUseCase,
    this._markPriceUseCase,
  ) : super(PlayerProfileInitial()) {
    _getPlayerProfile();
    _subscribeMarkPrice();
  }

  _getPlayerProfile() async {
    try {
      final data = await _playerProfileUseCase.getPlayerProfile();
      data.isNotEmpty ? gamePlayer = data.first : _insertGame();
      nameController.text = gamePlayer?.name ?? '';
      id = gamePlayer?.id;
      emit(GetPlayerProfileSuccess(gamePlayer: gamePlayer, games: games));
    } catch (e) {
      emit(PlayerProfileFail());
    }
  }

  _insertGame() async {
    final dataProfile =
        await _playerProfileUseCase.insertAccount(profileDefault);

    gamePlayer = dataProfile.first;

    emit(GetPlayerProfileSuccess(gamePlayer: dataProfile.first, games: games));
  }

  deleteData() {
    _playerProfileUseCase.deleteData();
  }

  updateName(String name) async {
    setName = name;
    if (name.isNotEmpty) {
      await _playerProfileUseCase.updateAcc(name: name, id: id);
      final data = await _playerProfileUseCase.getPlayerProfile();
      emit(GetPlayerProfileSuccess(
        gamePlayer: data.first,
        games: games,
      ));
    }
  }

  checkEmptyDataName() async {
    if (setName.isEmpty) {
      await _playerProfileUseCase.updateAcc(name: profileDefault.name, id: id);
      final data = await _playerProfileUseCase.getPlayerProfile();
      emit(GetPlayerProfileSuccess(gamePlayer: data.first, games: games));
    }
  }

  _subscribeMarkPrice() {
    _markPriceSub?.cancel();
    _markPriceSub = _markPriceUseCase
        .updateMarkPrice()
        .listen((event) {
      emit(UpdateMarkPriceSuccess(markPrice: event));
    });
  }

  @override
  close() async {
    _streamSubscription?.cancel();
    _markPriceSub?.cancel();

    return super.close();
  }
}
