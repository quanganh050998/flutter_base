import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_center/component/load_image.dart';
import 'package:game_center/component/style/style.dart';
import 'package:game_center/models/game_center/all_game_model.dart';
import 'package:game_center/presentation/game_center/game_onboarding/cubit/game_onboarding_cubit.dart';
import 'package:game_center/router/general_router.dart';

class GameOnBoardingAppBar extends StatefulWidget {
  final GameModel game;
  final ScrollController scrollController;

  const GameOnBoardingAppBar({
    Key? key,
    required this.scrollController,
    required this.game,
  }) : super(key: key);

  @override
  State<GameOnBoardingAppBar> createState() => _GameOnBoardingAppBarState();
}

class _GameOnBoardingAppBarState extends State<GameOnBoardingAppBar> {
  late GameOnBoardingCubit _cubit;
  late VoidCallback _scrollListener;
  double collapseTitleAlpha = 0.0;

  @override
  void initState() {
    super.initState();

    _cubit = context.read<GameOnBoardingCubit>();

    _scrollListener = () {
      if (widget.scrollController.hasClients) {
        var offset = widget.scrollController.offset;
        collapseTitleAlpha = (offset < 90) ? (offset / 90) : 1;

        _cubit.changeAppBarState(offset);
      }
    };

    widget.scrollController.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      expandedHeight: 310,
      pinned: true,
      floating: true,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_outlined,
          color: theme.color.gray50,
        ),
        onPressed: () {
          GeneralRouter.pop();
        },
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: BlocBuilder<GameOnBoardingCubit, GameOnBoardingState>(
        buildWhen: (_, crState) => crState is ChangeAppBarState,
        builder: (context, state) {
          return Text(
            widget.game.gameName,
            maxLines: 1,
            style: theme.font.t18MHeadline.copyWith(
              color: theme.color.gray50.withOpacity(collapseTitleAlpha),
            ),
          );
        },
      ),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            (widget.game.mobileBanners.isNotEmpty)
                ? LoadImage(
                    url: widget.game.mobileBanners.first.url,
                    boxFit: BoxFit.cover,
                    colorShimmer: theme.color.gray700,
                  )
                : Container(
              width: double.infinity,
                    color: theme.color.gray700,
                  ),
            Positioned(
              left: 0,
              right: 0,
              bottom: -1,
              child: Container(
                width: double.infinity,
                height: 156,
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      theme.color.gameBg,
                      theme.color.gameBg.withOpacity(0.8),
                      theme.color.gameBg.withOpacity(0),
                    ],
                  ),
                ),
                child: Text(
                  widget.game.gameName,
                  style: theme.font.t24SHeadline.copyWith(
                    color: theme.color.gray50,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_scrollListener);
    super.dispose();
  }
}
