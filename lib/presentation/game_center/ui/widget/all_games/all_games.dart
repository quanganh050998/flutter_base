import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_center/component/load_image.dart';
import 'package:game_center/component/style/style.dart';
import 'package:game_center/generated/assets.dart';
import 'package:game_center/generated/l10n.dart';
import 'package:game_center/models/game_center/all_game_model.dart';
import 'package:game_center/presentation/game_center/cubit/game_center_cubit.dart';
import 'package:game_center/presentation/game_center/game_onboarding/game_onboarding_route.dart';
import 'package:game_center/presentation/game_center/list_all_game/list_all_game_route.dart';
import 'package:game_center/presentation/game_center/ui/widget/all_games/shimmer_all_games.dart';

class AllGames extends StatelessWidget {
  const AllGames({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameCenterCubit, GameCenterState>(
      buildWhen: (previous, current) =>
          current is LoadingStartGame || current is GetDataStartGame,
      builder: (_, state) {

        if (state is LoadingStartGame) {
          return const ShimmerAllGames();
        }

        if (state is GetDataStartGame) {
          List<GameModel> gameModels = state.allGames;
          var games = List.generate(
            state.allGames.length > 4 ? 4 : state.allGames.length,
            (index) =>
                SizedBox(child: _gameItem(context, state.allGames[index])),
          );

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _titleAllGames(games: gameModels),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: games,
                ),
              ),
            ],
          );
        }

        return const SizedBox();
      },
    );
  }

  _titleAllGames({required List<GameModel> games}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
          ),
          child: Text(
            S.current.allGames,
            style: theme.font.t24SHeadline.copyWith(
              color: theme.color.gray50,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            ListAllGameRoute.pushNamed();
          },
          child: Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: theme.color.gray700,
            ),
            child: LoadImage(
              url: Assets.iconsArrowRight,
              height: 16,
              width: 16,
              colors: theme.color.primary3,
            ),
          ),
        ),
      ],
    );
  }

  _gameItem(BuildContext context, GameModel gameItem) {
    final width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () => GameOnBoardingRoute.pushNamed(game: gameItem),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gameItem.mobileBanners.isNotEmpty
              ? LoadImage(
                  url: gameItem.mobileBanners.first.url,
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  boxFit: BoxFit.cover,
                  height: (width - 48) / 2,
                  width: (width - 48) / 2,
                  colorShimmer: theme.color.gray700,
                )
              : Container(
                  height: (width - 48) / 2,
                  width: (width - 48) / 2,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    color: theme.color.gray400,
                  ),
                ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            width: (width - 48) / 2,
            child: Text(
              gameItem.gameName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.font.t16MBody.copyWith(
                color: theme.color.gray50,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
