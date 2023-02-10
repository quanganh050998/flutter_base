import 'package:flutter/material.dart';
import 'package:game_center/component/style/style.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPlayerProfile extends StatelessWidget {
  const ShimmerPlayerProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _header(),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          height: 1,
          color: theme.color.gray800,
        ),
        const SizedBox(
          height: 16,
        ),
        _containerShimmer(
          width: double.infinity,
          height: 160,
          radius: 16,
          padding: 16,
        ),
        _containerShimmer(
          width: double.infinity,
          height: 160,
          radius: 16,
          padding: 16,
        ),
      ],
    );
  }

  _header() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _containerShimmer(width: 90, height: 90, radius: 100),
          const SizedBox(
            width: 25,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _containerShimmer(
                      width: 18,
                      height: 18,
                      radius: 4,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    _containerShimmer(
                      width: 100,
                      height: 18,
                      radius: 4,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    _containerShimmer(
                      width: 100,
                      height: 20,
                      radius: 4,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    _containerShimmer(
                      width: 20,
                      height: 20,
                      radius: 4,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                _containerShimmer(
                  width: 100,
                  height: 18,
                  radius: 4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _containerShimmer({
    double? width,
    double? height,
    double? radius,
    double? padding,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding ?? 0),
      child: Shimmer.fromColors(
        baseColor: theme.color.gray700,
        highlightColor: theme.color.gray700.withOpacity(0.3),
        child: Container(
          width: width,
          height: height,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: theme.color.gray700,
            borderRadius: BorderRadius.all(Radius.circular(radius ?? 0)),
          ),
          margin: const EdgeInsets.only(
            bottom: 16,
          ),
        ),
      ),
    );
  }
}
