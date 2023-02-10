import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_center/component/load_image.dart';
import 'package:game_center/generated/assets.dart';
import 'package:game_center/presentation/game_center/cubit/game_center_cubit.dart';
import 'package:game_center/presentation/game_center/ui/widget/all_games/all_games.dart';
import 'package:game_center/presentation/game_center/ui/widget/banner_game/banner_hot_game.dart';
import 'package:game_center/presentation/game_center/ui/widget/game_center_app_bar.dart';
import 'package:game_center/presentation/game_center/ui/widget/total_earn_game_center.dart';


class GameCenterScreen extends StatefulWidget {
  const GameCenterScreen({Key? key}) : super(key: key);

  @override
  State<GameCenterScreen> createState() => _GameCenterScreenState();
}

class _GameCenterScreenState extends State<GameCenterScreen> {

  @override
  void initState() {
    super.initState();
  }

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeAreaCustom(
      background: LoadImage(
        url: Assets.imagesBgGameCenter,
        boxFit: BoxFit.cover,
        height: height,
        width: width,
      ),
      child: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            GameCenterAppBar(
              scrollController: _scrollController,
            ),
          ];
        },
        body: _body(),
      ),
    );
  }

  _body() {
    double paddingBody = 0;

    return BlocBuilder<GameCenterCubit, GameCenterState>(
      buildWhen: (_,current) => current is SetPaddingBodyGameCenter,
        builder: (_, state) {
        if(state is SetPaddingBodyGameCenter){
          paddingBody = state.paddingBody;
        }

      return Container(
        margin: EdgeInsets.only(top: paddingBody),
        child: _scrollView(),
      );
    },);
  }

  _scrollView(){
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: const [
          BannerHotGame(),
          SizedBox(
            height: 32,
          ),
          TotalEarnGameCenter(),
          SizedBox(
            height: 32,
          ),
          AllGames(),
          SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class SafeAreaCustom extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget child;
  final Widget? background;
  final Color? backgroundColor;

  const SafeAreaCustom({
    this.appBar,
    required this.child,
    this.background,
    this.backgroundColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (background != null) Positioned.fill(child: background!),
        if (backgroundColor != null)
          Positioned.fill(
            child: Container(
              color: backgroundColor,
            ),
          ),
        Positioned.fill(
          child: SafeArea(
            child: Scaffold(
              appBar: appBar,
              backgroundColor: Colors.transparent,
              body: child,
            ),
          ),
        ),
      ],
    );
  }
}

