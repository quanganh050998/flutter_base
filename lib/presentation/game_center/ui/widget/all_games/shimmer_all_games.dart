import 'package:flutter/material.dart';
import 'package:game_center/component/load_image.dart';
import 'package:game_center/component/style/style.dart';
import 'package:game_center/generated/assets.dart';
import 'package:game_center/generated/l10n.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerAllGames extends StatelessWidget {
  const ShimmerAllGames({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _titleAllGames(),
        const SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              _gameItem(context),
              _gameItem(context),
              _gameItem(context),
              _gameItem(context),
            ],
          ),
        ),
      ],
    );
  }

  _gameItem(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Shimmer.fromColors(
          baseColor: theme.color.gray700,
          highlightColor: theme.color.gray700.withOpacity(0.3),
          child: containerShimmer((width - 48) / 2, (width - 48) / 2, 16),
        ),
        const SizedBox(
          height: 8,
        ),
        Shimmer.fromColors(
          baseColor: theme.color.gray700,
          highlightColor: theme.color.gray700.withOpacity(0.3),
          child: containerShimmer((width - 48) / 3, 20, 6),
        ),
      ],
    );
  }


  containerShimmer(double width, double height, double radius) {
    return Container(
      decoration: BoxDecoration(
        color: theme.color.gray700,
        borderRadius: BorderRadius.circular(radius),
      ),
      width: width,
      height: height,
    );
  }

  _titleAllGames() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
          ),
          child: Text(
            S.current.allGames,
            style: theme.font.t24SHeadline.copyWith(
              color: theme.color.gray50,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 16),
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: theme.color.gray700,
          ),
          child: LoadImage(
            url: Assets.iconsArrowRight,
            height: 16,
            width: 16,
            colors: theme.color.primary3,
          ),
        ),
      ],
    );
  }

}
