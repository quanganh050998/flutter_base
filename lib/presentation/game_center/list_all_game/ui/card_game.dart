import 'package:flutter/material.dart';
import 'package:game_center/component/load_image.dart';
import 'package:game_center/component/style/style.dart';
import 'package:game_center/generated/l10n.dart';
import 'package:game_center/models/game_center/all_game_model.dart';
import 'package:game_center/presentation/game_center/game_onboarding/game_onboarding_route.dart';

class CardGame extends StatelessWidget {
  final GameModel game;

  const CardGame({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GameOnBoardingRoute.pushNamed(game: game);
      },
      child: Container(
        width: double.infinity,
        height: 160,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: const Alignment(0.0, 0.0),
            end: const Alignment(0.959, 0.283),
            colors: [
              theme.color.gameCard01.withOpacity(0.2),
              theme.color.gameCard02.withOpacity(0.2),
            ],
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        margin: const EdgeInsets.only(bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            (game.mobileBanners.isNotEmpty)
                ? LoadImage(
                    url: game.mobileBanners.first.url,
                    width: 128,
                    height: 128,
                    boxFit: BoxFit.cover,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    colorShimmer: theme.color.gray700,
                  )
                : Container(
                    width: 128,
                    height: 128,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      color: theme.color.gray700,
                    ),
                  ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    game.gameName,
                    style: theme.font.t18MHeadline.copyWith(
                      color: theme.color.gray50,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    game.shortDescription,
                    style: theme.font.t14RParagraph.copyWith(
                      color: theme.color.gray500,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  _buttonPlay(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buttonPlay() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 51,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            theme.color.gameButton1,
            theme.color.gameButton2,
          ],
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Text(
        S.current.play,
        style: theme.font.t14MButton.copyWith(
          color: theme.color.pureWhite,
        ),
      ),
    );
  }
}
