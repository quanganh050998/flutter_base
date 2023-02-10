import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_center/component/load_image.dart';
import 'package:game_center/component/style/style.dart';
import 'package:game_center/generated/assets.dart';
import 'package:game_center/generated/l10n.dart';
import 'package:game_center/presentation/game_center/cubit/game_center_cubit.dart';
import 'package:game_center/presentation/game_center/player_profile/player_profile_route.dart';
import 'package:game_center/router/general_router.dart';

class GameCenterAppBar extends StatefulWidget {
  final ScrollController scrollController;

  const GameCenterAppBar({Key? key, required this.scrollController})
      : super(key: key);

  @override
  State<GameCenterAppBar> createState() => _GameCenterAppBarState();
}

class _GameCenterAppBarState extends State<GameCenterAppBar> {
  late GameCenterCubit _cubit;
  late VoidCallback _scrollListener;
  double collapseTitleAlpha = 0.0;

  @override
  void initState() {
    super.initState();

    _cubit = context.read<GameCenterCubit>();

    _scrollListener = () {
      if (widget.scrollController.hasClients) {
        var offset = widget.scrollController.offset;
        collapseTitleAlpha = (offset < 90) ? (offset / 90) : 1;
        _cubit.changeAppBarState();
        _cubit.changePaddingBody(offset);
      }
    };

    widget.scrollController.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      expandedHeight: 160,
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
      title: BlocBuilder<GameCenterCubit, GameCenterState>(
        buildWhen: (_, crState) => crState is ChangeAppBarState,
        builder: (_, state) {
          return Text(
            S.current.playToEarn,
            maxLines: 1,
            style: theme.font.t18MHeadline.copyWith(
              color: theme.color.gray50.withOpacity(collapseTitleAlpha),
            ),
          );
        },
      ),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: (){
                            ThemeManager.updateThemeMode(brightness == Brightness.dark? false : true);
                          },
                          child: Text(
                            S.current.playToEarn,
                            style: theme.font.t28SHeadline.copyWith(
                              color: theme.color.gray50,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          S.current.tryOurBestGamesNowToEarnRewards,
                          style: theme.font.t14RBody.copyWith(
                            color: theme.color.gray500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () => PlayerProfileRoute.push(),
                    child: LoadImage(
                      url: Assets.imagesMaskGroup,
                      height: 74,
                      width: 74,
                      boxFit: BoxFit.cover,
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      colorShimmer: theme.color.gray700,
                      circular: 50,
                    ),
                  ),
                ],
              ),
            ],
          ),
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
