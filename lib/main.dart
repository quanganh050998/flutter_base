import 'package:flutter/material.dart';
import 'package:game_center/component/style/style.dart';
import 'package:game_center/di/di.dart';
import 'package:game_center/manifest.dart';
import 'package:game_center/presentation/game_center/game_center_page_route.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:game_center/router/router_define.dart';
import 'package:game_center/untility/firebase_utils.dart';
import 'package:get/get.dart';

import 'generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();
  await setupFirebase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        brightness: brightness,
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      onGenerateRoute: (settings) => manifest(
        generateRoutes,
          settings,
          mapRoutes,
      ),
      initialRoute: '$GameCenterPageRoute',
    );
  }
}


