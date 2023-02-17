import 'package:flutter/material.dart';
import 'package:game_center/di/di.dart';
import 'package:game_center/env_config.dart';
import 'package:game_center/presentation/main_app.dart';
import 'package:game_center/untility/firebase_utils.dart';
import 'flavors.dart';

const env = String.fromEnvironment("Env", defaultValue: Environment.prod);

Future<void> main() async {
  F.appFlavor = Flavor.PROD;
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies(env);
  await setupFirebase();

  runApp(const MyApp());
}
