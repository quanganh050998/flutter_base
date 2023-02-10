import 'package:flutter/material.dart';
import 'package:game_center/component/style/style.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBox extends StatelessWidget {
  const ShimmerBox({this.heightShimmer, this.widthShimmer, this.colorBg, Key? key})
      : super(key: key);
  final double? widthShimmer;
  final double? heightShimmer;
  final Color? colorBg;

  @override
  Widget build(BuildContext context) {

    return Shimmer.fromColors(
      baseColor: colorBg ??  theme.color.neutral9,
      highlightColor: (colorBg ?? theme.color.neutral9).withOpacity(0.3),
      enabled: true,
      child: Container(
        decoration: BoxDecoration(
          color: colorBg ?? theme.color.neutral9,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        width: widthShimmer ?? 40,
        height: heightShimmer ?? 20,
      ),
    );
  }
}
