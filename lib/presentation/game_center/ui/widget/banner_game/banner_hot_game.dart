import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_center/component/load_image.dart';
import 'package:game_center/component/style/style.dart';
import 'package:game_center/models/game_center/all_game_model.dart';
import 'package:game_center/presentation/game_center/cubit/game_center_cubit.dart';
import 'package:game_center/presentation/game_center/ui/widget/banner_game/item_banner_hot_game.dart';
import 'package:game_center/presentation/game_center/ui/widget/banner_game/shimmer_box.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerHotGame extends StatelessWidget {
  const BannerHotGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<GameModel> listModel = [];

    return BlocBuilder<GameCenterCubit, GameCenterState>(
      buildWhen: (_, current) =>
          current is LoadingStartGame || current is GetDataStartGame,
      builder: (_, state) {
        if (state is LoadingStartGame) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: ShimmerBox(
              widthShimmer: double.infinity,
              heightShimmer: 211,
              colorBg: theme.color.gray700,
            ),
          );
        }
        if (state is GetDataStartGame) {
          listModel = state.listModel;

          return listModel.isEmpty
              ? Container()
              : _BannerHotGame(gameModel: listModel);
        }

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: ShimmerBox(
            widthShimmer: double.infinity,
            heightShimmer: 211,
            colorBg: theme.color.gray700,
          ),
        );
      },
    );
  }
}

class _BannerHotGame extends StatefulWidget {
  const _BannerHotGame({required this.gameModel, Key? key}) : super(key: key);
  final List<GameModel> gameModel;

  @override
  State<_BannerHotGame> createState() => _BannerHotGameState();
}

class _BannerHotGameState extends State<_BannerHotGame> {
  int _currentPage = 0;
  List<Widget> listImage = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (final ele in widget.gameModel) {
      listImage.add(LoadImage(
        url: ele.mobileBanners.firstWhere((e) => e.isMobile ?? true).url,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        boxFit: BoxFit.cover,
        height: 213,
        width: double.infinity,
        colorShimmer: theme.color.gray700,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Wrap(
              children: listImage
                  .map((item) => Container(
                        width: 0,
                        height: 0,
                        color: Colors.white,
                        child: item,
                      ))
                  .toList()
                  .cast<Widget>(),
            ),
            Positioned(
              child: CarouselSlider.builder(
                itemCount: widget.gameModel.length,
                options: CarouselOptions(
                  autoPlay: true,
                  enableInfiniteScroll: true,
                  disableCenter: false,
                  enlargeCenterPage: true,
                  aspectRatio: 25 / 9,
                  autoPlayAnimationDuration: const Duration(milliseconds: 300),
                  autoPlayInterval: const Duration(milliseconds: 3000),
                  pageSnapping: true,
                  height: 213,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    _currentPage = index;
                    setState(() {});
                  },
                ),
                itemBuilder: (
                  context,
                  index,
                  realIndex,
                ) {
                  return ItemBannerHotGame(
                    gameModel: widget.gameModel[index],
                    imageSlider: listImage[index],
                  );
                },
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        AnimatedSmoothIndicator(
          count: widget.gameModel.length,
          activeIndex: _currentPage,
          effect: CustomizableEffect(
            activeDotDecoration: DotDecoration(
              width: 8,
              height: 8,
              color: theme.color.green1,
              rotationAngle: 0,
              verticalOffset: 0,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            dotDecoration: const DotDecoration(
              width: 5,
              height: 5,
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              verticalOffset: 0,
            ),
            spacing: 8.0,
          ),
        ),
      ],
    );
  }
}
