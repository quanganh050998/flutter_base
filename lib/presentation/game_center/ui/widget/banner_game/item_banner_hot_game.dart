import 'package:flutter/material.dart';
import 'package:game_center/component/style/style.dart';
import 'package:game_center/generated/l10n.dart';
import 'package:game_center/models/game_center/all_game_model.dart';
import 'package:game_center/presentation/game_center/game_onboarding/game_onboarding_route.dart';

class ItemBannerHotGame extends StatelessWidget {
  const ItemBannerHotGame({required this.gameModel, required this.imageSlider, Key? key})
      : super(key: key);
  final GameModel gameModel;
  final Widget imageSlider;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GameOnBoardingRoute.pushNamed(game: gameModel);
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Stack(
          children: [
            if (gameModel.mobileBanners.isNotEmpty)
              Positioned(
                child: imageSlider,
              )
            else
              Positioned(
                child: Container(
                  height: 213,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    color: theme.color.gray400,
                  ),
                ),
              ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(16),
                  ),
                  color: theme.color.pureBlack.withOpacity(0.6),
                ),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  gameModel.gameName,
                                  style: theme.font.t18SHeadline
                                      .copyWith(color: theme.color.gray50),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(
                                width: 32,
                              ),
                            ],
                          ),
                          Text(
                            gameModel.shortDescription,
                            style: theme.font.t14RBody
                                .copyWith(color: theme.color.gray400),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: _buttonPlay(gameModel),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buttonPlay(GameModel gameMode) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 28,
        vertical: 10,
      ),
      margin: const EdgeInsets.only(right: 32),
      alignment: Alignment.center,
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
