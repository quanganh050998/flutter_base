import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:game_center/component/load_image.dart';
import 'package:game_center/component/style/style.dart';
import 'package:game_center/generated/l10n.dart';
import 'package:game_center/models/game_center/all_game_model.dart';

class CardClaimRewards extends StatelessWidget {
  final GameModel game;

  const CardClaimRewards({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
        child: Container(
          width: double.infinity,
          height: 150,
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
                      url: game.mobileBanners
                          .firstWhere((e) => e.isMobile ?? true)
                          .url,
                      width: 116,
                      height: 116,
                      boxFit: BoxFit.cover,
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      colorShimmer: theme.color.gray700,
                    )
                  : Container(
                      width: 116,
                      height: 116,
                      color: theme.color.gray700,
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
                      '\$9,123.34',
                      style: theme.font.t24SHeadline.copyWith(
                        color: theme.color.primary3,
                      ),
                      maxLines: 1,
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
      ),
    );
  }

  _buttonPlay() {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 28,
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
          S.current.claim,
          style: theme.font.t14MButton.copyWith(
            color: theme.color.pureWhite,
          ),
        ),
      ),
    );
  }
}
