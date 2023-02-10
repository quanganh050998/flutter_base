import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_center/component/style/style.dart';
import 'package:game_center/generated/assets.dart';
import 'package:game_center/generated/l10n.dart';
import 'package:game_center/presentation/game_center/cubit/game_center_cubit.dart';

class TotalEarnGameCenter extends StatelessWidget {
  const TotalEarnGameCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      width: double.infinity,
      height: 100,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            foregroundDecoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  Assets.imagesBgTotalEarnGameCenter,
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Row(
            children: [
              const Spacer(),
              _itemTotalEarn(),
              const Spacer(),
              _itemTotalParticipant(),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }

  _itemTotalEarn() {
    return Expanded(
      flex: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 6,),
          BlocBuilder<GameCenterCubit, GameCenterState>(
            buildWhen: (_, current) => current is GetDataStartGame,
            builder: (_, state) {
              double totalEarn = 0;
              if (state is GetDataStartGame) {
                totalEarn = state.gameDashboardModel.totalEarned;
              }

              return Text(
                '\$${totalEarn.toString()}',
                style: theme.font.t24SHeadline
                    .copyWith(color: theme.color.gray50, shadows: [
                  Shadow(
                    color: theme.color.game004100,
                    offset: const Offset(0, 0),
                    blurRadius: 7,
                  ),
                ]),
              );
            },),
          Text(
            S.current.totalEarned,
            style: theme.font.t14RBody.copyWith(
              color: theme.color.neutral6,
              shadows: [],
            ),
          ),
          const SizedBox(height: 6,),
        ],
      ),
    );
  }

  _itemTotalParticipant() {
    return Expanded(
      flex: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 6,),
          BlocBuilder<GameCenterCubit, GameCenterState>(
            buildWhen: (_, current) => current is GetDataStartGame,
            builder: (_, state) {
              double totalParticipant = 0;
              if (state is GetDataStartGame) {
                totalParticipant = state.gameDashboardModel.totalParticipants;
              }

              return Text(
                totalParticipant.toString(),
                style: theme.font.t24SHeadline
                    .copyWith(color: theme.color.gray50, shadows: [
                  Shadow(
                    color: theme.color.game004100,
                    offset: const Offset(0, 0),
                    blurRadius: 7,
                  ),
                ]),
              );
            },),
          Text(
            S.current.totalParticipants,
            style: theme.font.t14RBody.copyWith(
              color: theme.color.neutral6,
              shadows: [],
            ),
          ),
          const SizedBox(height: 6,),
        ],
      ),
    );
  }
}
