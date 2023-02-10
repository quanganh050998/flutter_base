import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_center/di/di.dart';
import 'package:game_center/presentation/game_center/player_profile/cubit/player_profile_cubit.dart';
import 'package:game_center/presentation/game_center/player_profile/ui/player_profile_screen.dart';
import 'package:game_center/router/general_router.dart';
import 'package:game_center/router/router_define.dart';

class PlayerProfileRoute extends RouteDefine {
  @override
  Path initRoute(dynamic arguments) {
    return Path(
      builder: (_) => BlocProvider<PlayerProfileCubit>(
        create: (_) => getIt<PlayerProfileCubit>(),
        child: const PlayerProfileScreen(),
      ),
    );
  }

  static Future<dynamic> push(){
    return GeneralRouter.push<PlayerProfileRoute>();
  }
}
