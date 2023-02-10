import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_center/di/di.dart';
import 'package:game_center/presentation/game_center/cubit/game_center_cubit.dart';
import 'package:game_center/presentation/game_center/ui/game_center_sceen.dart';
import 'package:game_center/router/general_router.dart';
import 'package:game_center/router/router_define.dart';

class GameCenterPageRoute extends RouteDefine {
  @override
  Path initRoute(dynamic arguments) {
    return Path(
      builder: (_) => MultiBlocProvider(
        providers: [
          BlocProvider<GameCenterCubit>(
            create: (_) => getIt<GameCenterCubit>(),
          ),
        ],
        child: const GameCenterScreen(),
      ),
    );
  }

  static Future<dynamic> pushNamed() {
    return GeneralRouter.push<GameCenterPageRoute>();
  }
}