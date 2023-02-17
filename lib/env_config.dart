import 'package:injectable/injectable.dart';

abstract class Environment {
  static const String qc = 'qc';
  static const String prod = 'prod';
}

abstract class BuildConfig{
  String get urlAPI;
}

@Injectable(as: BuildConfig, env: [Environment.prod])
class BuildConfigProd extends BuildConfig{

  @override
  String get urlAPI => 'https://www.google.com';
}

@Injectable(as: BuildConfig, env: [Environment.qc])
class BuildConfigQC extends BuildConfig{

  @override
  String get urlAPI => 'https://www.google.com/qc';
}
