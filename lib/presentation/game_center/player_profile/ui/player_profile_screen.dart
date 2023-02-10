import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_center/component/load_image.dart';
import 'package:game_center/component/style/style.dart';
import 'package:game_center/generated/assets.dart';
import 'package:game_center/generated/l10n.dart';
import 'package:game_center/models/game_center/all_game_model.dart';
import 'package:game_center/presentation/game_center/player_profile/cubit/player_profile_cubit.dart';
import 'package:game_center/presentation/game_center/player_profile/ui/widget/card_claim_rewards.dart';
import 'package:game_center/presentation/game_center/player_profile/ui/widget/header_player_profile.dart';
import 'package:game_center/presentation/game_center/player_profile/ui/widget/not_earned_any_rewards.dart';
import 'package:game_center/presentation/game_center/player_profile/ui/widget/shimer_player_profile.dart';
import 'package:game_center/presentation/game_center/ui/game_center_sceen.dart';

class PlayerProfileScreen extends StatefulWidget {
  const PlayerProfileScreen({Key? key}) : super(key: key);

  @override
  State<PlayerProfileScreen> createState() => _PlayerProfileScreenState();
}

class _PlayerProfileScreenState extends State<PlayerProfileScreen> {
  late PlayerProfileCubit cubit;
  List<GameModel> games = [];

  @override
  void initState() {
    cubit = context.read<PlayerProfileCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SafeAreaCustom(
        appBar: _buildAppBar(),
        background: _buildBackground(height, width),
        child: _body(context),
      ),
    );
  }

  _buildBackground(double height, double width) {
    return LoadImage(
      url: Assets.imagesBgGameOnboading,
      boxFit: BoxFit.cover,
      height: height,
      width: width,
    );
  }

  _body(BuildContext context) {
    return BlocBuilder<PlayerProfileCubit, PlayerProfileState>(
      buildWhen: (_, crState) =>
          crState is PlayerProfileFail ||
          crState is PlayerProfileLoading ||
          crState is GetPlayerProfileSuccess,
      builder: (context, state) {
        if (state is GetPlayerProfileSuccess) {
          games = cubit.games;

          return _listGameEarnedRewards(games: games);
        }
        if (state is PlayerProfileFail) {
          return _empty();
        }

        return const ShimmerPlayerProfile();
      },
    );
  }

  _listGameEarnedRewards({required List<GameModel> games}) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        HeaderPlayerProfile(
          customName: cubit.gamePlayer?.name ?? '',
          age: cubit.gamePlayer?.age ?? '',
          description: cubit.gamePlayer?.description ?? '',
        ),
        const SizedBox(
          height: 24,
        ),
        _markPrice(),
        const SizedBox(
          height: 24,
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          width: double.infinity,
          height: 1.4,
          color: theme.color.gray800,
        ),
        (games.isNotEmpty)
            ? Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 24,
                  ),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return CardClaimRewards(
                      game: games[index],
                    );
                  },
                  itemCount: games.length,
                ),
              )
            : NotEarnedAnyRewards(
                games: games,
              ),
      ],
    );
  }

  _markPrice() {
    double markPrice = 0;
    return BlocBuilder<PlayerProfileCubit, PlayerProfileState>(
      builder: (context, state) {
        if (state is UpdateMarkPriceSuccess) {
          markPrice = state.markPrice;
        }
        return Text(
          markPrice.toString(),
          style: theme.font.t14RBody.copyWith(color: theme.color.neutral8),
        );
      },
    );
  }

  _empty() {
    return Center(
      child: Text(S.current.empty,
          style: theme.font.t14RBody.copyWith(
            color: theme.color.neutral7,
          )),
    );
  }

  _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        S.current.playerProfile,
        style: theme.font.t18MHeadline.copyWith(
          color: theme.color.gray50,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.cleaning_services,
            color: theme.color.gray50,
          ),
          onPressed: () {
            context.read<PlayerProfileCubit>().deleteData();
          },
        ),
      ],
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_outlined,
          color: theme.color.gray50,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
