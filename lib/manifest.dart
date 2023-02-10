import 'package:game_center/presentation/game_center/game_center_page_route.dart';
import 'package:game_center/presentation/game_center/game_onboarding/game_onboarding_route.dart';
import 'package:game_center/presentation/game_center/list_all_game/list_all_game_route.dart';
import 'package:game_center/presentation/game_center/player_profile/player_profile_route.dart';
import 'package:game_center/router/router_define.dart';

generateRoutes(){
  GameOnBoardingRoute();
  GameCenterPageRoute();
  PlayerProfileRoute();
  ListAllGameRoute();
}

// TODO: Add more route
final Map<String, RouteDefine> mapRoutes = {};