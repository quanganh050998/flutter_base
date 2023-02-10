import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_center/component/load_image.dart';
import 'package:game_center/component/style/style.dart';
import 'package:game_center/generated/assets.dart';
import 'package:game_center/generated/l10n.dart';
import 'package:game_center/models/game_center/all_game_model.dart';
import 'package:game_center/presentation/game_center/game_onboarding/cubit/game_onboarding_cubit.dart';
import 'package:game_center/presentation/game_center/game_onboarding/ui/widget/card_total_earned.dart';
import 'package:game_center/presentation/game_center/game_onboarding/ui/widget/game_onboarding_app_bar.dart';

class GameOnBoardingScreen extends StatefulWidget {
  final GameModel game;

  const GameOnBoardingScreen({Key? key, required this.game}) : super(key: key);

  @override
  State<GameOnBoardingScreen> createState() => _GameOnBoardingScreenState();
}

class _GameOnBoardingScreenState extends State<GameOnBoardingScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      left: false,
      right: false,
      child: Stack(
        children: [
          const LoadImage(
            url: Assets.imagesBgGameOnboading,
            boxFit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: NestedScrollView(
              controller: _scrollController,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  GameOnBoardingAppBar(
                    scrollController: _scrollController,
                    game: widget.game,
                  ),
                ];
              },
              body: _body(),
            ),
          ),
        ],
      ),
    );
  }

  _body() {
    return BlocBuilder<GameOnBoardingCubit, GameOnBoardingState>(
      buildWhen: (_, crState) => crState is ChangeAppBarState,
      builder: (context, state) {
        double top = 0;
        if (state is ChangeAppBarState) {
          top = state.offset;
        }

        return Container(
          margin: EdgeInsets.only(
            top: top,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CardTotalEarned(),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  S.current.gameDescription,
                  style: theme.font.t18SHeadline.copyWith(
                    color: theme.color.gray50,
                  ),
                ),
              ),
              _content(),
              _button(),
            ],
          ),
        );
      },
    );
  }

  _content() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: SingleChildScrollView(
                // primary: false,
                physics: const ClampingScrollPhysics(),
                child: Text(
                  widget.game.description,
                  style: theme.font.t14RParagraph.copyWith(
                    color: theme.color.gray500,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }

  _button() {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16),
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
            S.current.playNow,
            style: theme.font.t16SBody.copyWith(
              color: theme.color.pureWhite,
            ),
          ),
        ),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
