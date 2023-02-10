import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_center/component/style/style.dart';
import 'package:game_center/generated/l10n.dart';
import 'package:game_center/presentation/game_center/game_onboarding/cubit/game_onboarding_cubit.dart';

class CardTotalEarned extends StatefulWidget {
  const CardTotalEarned({
    Key? key,
  }) : super(key: key);

  @override
  State<CardTotalEarned> createState() => _CardTotalEarnedState();
}

class _CardTotalEarnedState extends State<CardTotalEarned> {
  int players = 0;
  double totalEarned = 0;
  int playersEarned = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameOnBoardingCubit, GameOnBoardingState>(
      buildWhen: (_, crState) => crState is DataDashBoardState,
      builder: (context, state) {
        if (state is DataDashBoardState) {
          totalEarned = state.gameDashboardModel.totalEarned;
          players = state.gameDashboardModel.totalPlayers;
          playersEarned = 0;
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              _divider(),
              const SizedBox(
                height: 16,
              ),
              _content(
                players: players,
                totalEarned: totalEarned,
                playersEarned: playersEarned,
              ),
              const SizedBox(
                height: 16,
              ),
              _divider(),
            ],
          ),
        );
      },
    );
  }

  _content({
    required int players,
    required double totalEarned,
    required int playersEarned,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _column(
          columnName: S.current.players,
          // parameter: convertLessVolume(players.toString()),
          value: CrossAxisAlignment.start,
          size: 1,
          parameter: players.toString(),
        ),
        _column(
          columnName: S.current.totalEarned,
          // parameter: '\$${convertLessVolume(totalEarned.toString())}',
          parameter: '\$${totalEarned.toString()}',
          value: CrossAxisAlignment.center,
          size: 1,
        ),
        _column(
          columnName: S.current.playersEarned,
          // parameter: convertLessVolume(playersEarned.toString()),
          parameter: playersEarned.toString(),
          value: CrossAxisAlignment.end,
          size: 1,
        ),
      ],
    );
  }

  _column({
    required String columnName,
    required String parameter,
    required CrossAxisAlignment value,
    required int size,
  }) {
    return Expanded(
      flex: size,
      child: Column(
        crossAxisAlignment: value,
        children: [
          Text(
            parameter,
            style: theme.font.t18SHeadline.copyWith(
              color: theme.color.gray50,
            ),
            maxLines: 1,
          ),
          Text(
            columnName,
            style: theme.font.t12RParagraph.copyWith(
              color: theme.color.gray500,
            ),
            textAlign: TextAlign.end,
            maxLines: 2,
          ),
        ],
      ),
    );
  }

  _divider() {
    return Container(
      color: theme.color.gray800,
      width: double.infinity,
      height: 1,
    );
  }
}
