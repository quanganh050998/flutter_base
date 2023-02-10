import 'package:flutter/material.dart';

final List<RouteDefine> _routes = [];
final List<String> _routeIds = [];

abstract class RouteDefine {
  Path initRoute(dynamic arguments);

  String get routeName => '$runtimeType';

  static List<String> get routeIds => _routeIds;

  RouteDefine() {
    _routes.add(this);
    _routeIds.add('$runtimeType');
  }
}

class Path {
  WidgetBuilder builder;

  Path({required this.builder});
}

MaterialPageRoute? manifest(
  Function generateRoute,
  RouteSettings settings,
  Map<String, RouteDefine> mapRoutes,
) {
  final Map<String?, WidgetBuilder?> routeBuilders = <String, WidgetBuilder>{};

  generateRoute();
  for (int i = 0; i < _routeIds.length; i++) {
    final path = _routes[i].initRoute(
      settings.arguments,
    );

    routeBuilders[_routeIds[i]] = path.builder;
  }
  final Widget Function(BuildContext context)? routeBuilder =
      routeBuilders[settings.name ?? ''];

  return CustomMaterialPageRoute(
    builder: (context) => routeBuilder!(context),
    settings: RouteSettings(
      name: settings.name,
      arguments: settings.arguments,
    ),
  );
}

class CustomMaterialPageRoute extends MaterialPageRoute {
  @override
  @protected
  bool get hasScopedWillPopCallback {
    return false;
  }

  CustomMaterialPageRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
          builder: builder,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
        );
}
