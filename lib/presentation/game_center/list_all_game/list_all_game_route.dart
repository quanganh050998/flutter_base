import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_center/di/di.dart';
import 'package:game_center/presentation/game_center/list_all_game/cubit/list_all_game_cubit.dart';
import 'package:game_center/presentation/game_center/list_all_game/ui/list_all_game.dart';
import 'package:game_center/router/general_router.dart';
import 'package:game_center/router/router_define.dart';

const keyListAllGame = 'keyListAllGame';

class ListAllGameRoute extends RouteDefine {
  @override
  Path initRoute(dynamic arguments) => Path(
        builder: (_) => BlocProvider<ListAllGameCubit>(
          create: (context) => getIt<ListAllGameCubit>(),
          child: ListAllGame(),
        ),
      );

  static Future<dynamic> pushNamed() {
    return GeneralRouter.push<ListAllGameRoute>();
  }
}
