import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_center/di/di.dart';
import 'package:game_center/models/game_center/all_game_model.dart';
import 'package:game_center/presentation/game_center/game_onboarding/cubit/game_onboarding_cubit.dart';
import 'package:game_center/presentation/game_center/game_onboarding/ui/game_onboarding_screen.dart';
import 'package:game_center/router/general_router.dart';
import 'package:game_center/router/router_define.dart';

const keyGame = 'keyGame';

class GameOnBoardingRoute extends RouteDefine {
  @override
  Path initRoute(dynamic arguments) => Path(
        builder: (_) => BlocProvider<GameOnBoardingCubit>(
          create: (context) => getIt<GameOnBoardingCubit>(),
          child: GameOnBoardingScreen(
            game: arguments[keyGame] as GameModel,
          ),
        ),
      );

  static Future<dynamic> pushNamed({required GameModel game}) {
    return GeneralRouter.push<GameOnBoardingRoute>(arguments: {
      keyGame: game,
    });
  }
}
