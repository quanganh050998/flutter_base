import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:game_center/component/load_image.dart';
import 'package:game_center/component/style/style.dart';
import 'package:game_center/generated/assets.dart';
import 'package:game_center/generated/l10n.dart';
import 'package:game_center/presentation/game_center/player_profile/cubit/player_profile_cubit.dart';

class HeaderPlayerProfile extends StatefulWidget {
  final String customName;
  final String age;
  final String description;

  const HeaderPlayerProfile({
    Key? key,
    required this.customName,
    required this.age,
    required this.description,
  }) : super(key: key);

  @override
  State<HeaderPlayerProfile> createState() => _HeaderPlayerProfileState();
}

class _HeaderPlayerProfileState extends State<HeaderPlayerProfile> {
  late StreamSubscription<bool> keyboardSubscription;
  var keyboardVisibilityController = KeyboardVisibilityController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Subscribe
    keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
      if (!visible) {
        _checkValueTextFieldValue();
      }
    });
  }

  @override
  void dispose() {
    keyboardSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LoadImage(
            url: Assets.imagesMaskGroup,
            height: 90,
            width: 90,
            boxFit: BoxFit.cover,
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            colorShimmer: theme.color.gray700,
            circular: 100,
          ),
          const SizedBox(
            width: 25,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    LoadImage(
                      url: Assets.iconsWalletLine,
                      height: 18,
                      width: 18,
                      colors: theme.color.gray500,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Flexible(
                      child: TextField(
                        cursorColor: theme.color.neutral7,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 8),
                          border: InputBorder.none,
                          hintText: S.current.name,
                          hintStyle: theme.font.t16MBody
                              .copyWith(color: theme.color.neutral4),
                          prefixIconConstraints:
                              const BoxConstraints(minWidth: 50, maxWidth: 60),
                        ),
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        onChanged: (value) {
                          context.read<PlayerProfileCubit>().updateName(value);
                        },
                        style: theme.font.t16MBody
                            .copyWith(color: theme.color.neutral8),
                        controller:
                            context.read<PlayerProfileCubit>().nameController,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                GestureDetector(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: widget.age));
                  },
                  child: Row(
                    children: [
                      Text(
                        widget.age,
                        style: theme.font.t16MBody.copyWith(
                          color: theme.color.gray50,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      LoadImage(
                        url: Assets.iconsDuplicate,
                        height: 20,
                        width: 20,
                        colors: theme.color.blue500,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            theme.color.gameLine1,
                            theme.color.gameLine2,
                          ],
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(1.2),
                        decoration: BoxDecoration(
                          color: theme.color.gameBg,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 3.8,
                            bottom: 3.8,
                            right: 10.8,
                            left: 32.8,
                          ),
                          child: Text(
                            widget.description.toString(),
                            style: theme.font.t20SHeadline.copyWith(
                              color: theme.color.gray50,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 0,
                      child: LoadImage(
                        url: Assets.iconsGoldDollar,
                        height: 38,
                        width: 38,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _checkValueTextFieldValue() {
    context.read<PlayerProfileCubit>().checkEmptyDataName();
  }
}
