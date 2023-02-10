import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_center/component/load_image.dart';
import 'package:game_center/component/style/style.dart';
import 'package:game_center/generated/assets.dart';
import 'package:game_center/generated/l10n.dart';
import 'package:game_center/presentation/game_center/list_all_game/cubit/list_all_game_cubit.dart';
import 'package:game_center/presentation/game_center/list_all_game/ui/card_game.dart';
import 'package:game_center/presentation/game_center/ui/game_center_sceen.dart';
import 'package:shimmer/shimmer.dart';

class ListAllGame extends StatefulWidget {
  const ListAllGame({Key? key}) : super(key: key);

  @override
  State<ListAllGame> createState() => _ListAllGameState();
}

class _ListAllGameState extends State<ListAllGame> {
  late ListAllGameCubit cubit;

  @override
  void initState() {
    cubit = context.read<ListAllGameCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeAreaCustom(
      background: const LoadImage(
        url: Assets.imagesBgGameCenter,
        boxFit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
      appBar: _buildAppbar(),
      child: _buildBody(),
    );
  }

  _buildAppbar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_outlined,
          color: theme.color.gray50,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        S.current.allGames,
        style: theme.font.t18MHeadline.copyWith(color: theme.color.gray50),
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<ListAllGameCubit, ListAllGameState>(
      buildWhen: (_, crState) =>
          crState is GetDataListGameSuccess ||
          crState is ListGameInitState ||
          crState is LoadingState,
      builder: (context, state) {
        return (state is LoadingState)
            ? _shimmer()
            : cubit.games.isEmpty
                ? _empty()
                : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 16,
                          ),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return CardGame(
                              game: cubit.games[index],
                            );
                          },
                          itemCount: cubit.games.length,
                        ),
                      ),
                    ],
                  );
        //todo: sau co core roi them
        // : PosiRefresher(
        //     controller: cubit.refreshController,
        //     enablePullUp: cubit.gamePage < cubit.gamePageCount,
        //     enablePullDown: true,
        //     loadMore: cubit.loadMoreGame,
        //     onRefresh: cubit.refreshListGames,
        //     child: Column(
        //       children: [
        //         Expanded(
        //           child: ListView.builder(
        //             padding: const EdgeInsets.symmetric(
        //               vertical: 16,
        //               horizontal: 16,
        //             ),
        //             shrinkWrap: true,
        //             itemBuilder: (BuildContext context, int index) {
        //               return CardGame(
        //                 game: cubit.games[index],
        //               );
        //             },
        //             itemCount: cubit.games.length,
        //           ),
        //         ),
        //       ],
        //     ),
        //   );
      },
    );
  }

  _empty() {
    return Container();
    //todo: sau co core roi bo comment
    // return Column(
    //   children: [
    //     CustomEmptyWidget(
    //       imageUrl: Assets.imagesNotFoundDark,
    //       imageWidth: 250,
    //       imageHeight: 250,
    //       message: S.current.noData,
    //     ),
    //   ],
    // );
  }

  _shimmer() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Shimmer.fromColors(
            baseColor: theme.color.gray700,
            highlightColor: theme.color.gray700.withOpacity(0.3),
            child: Container(
              width: double.infinity,
              height: 160,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.color.gray700,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              margin: const EdgeInsets.only(bottom: 16),
            ),
          );
        },
        itemCount: 4,
      ),
    );
  }
}
