import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:game_center/component/load_image.dart';
import 'package:game_center/component/style/style.dart';
import 'package:game_center/generated/assets.dart';
import 'package:game_center/generated/l10n.dart';
import 'package:game_center/models/game_center/all_game_model.dart';
import 'package:game_center/presentation/game_center/list_all_game/list_all_game_route.dart';

class NotEarnedAnyRewards extends StatelessWidget {
  final List<GameModel> games;

  const NotEarnedAnyRewards({Key? key, required this.games}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          const LoadImage(
            url: Assets.imagesNotConnectDappDark,
            height: 166,
            width: 166,
          ),
          const SizedBox(height: 20),
          Text(
            S.current.notEarnedAnyRewards,
            style: theme.font.t16RBody.copyWith(
              color: theme.color.gray500,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: theme.font.t16RBody,
                children: <TextSpan>[
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        ListAllGameRoute.pushNamed();
                      },
                    text: S.current.textPlayNow,
                    style: theme.font.t16MBody.copyWith(
                      color: theme.color.primary3,
                    ),
                  ),
                  TextSpan(
                    text: ' ${S.current.toGetHighRewards}',
                    style: theme.font.t16RBody.copyWith(
                      color: theme.color.gray500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            flex: 2,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}
