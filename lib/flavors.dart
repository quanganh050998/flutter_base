enum Flavor {
  PROD,
  QC,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.PROD:
        return 'Game Center App Prod';
      case Flavor.QC:
        return 'Game Center App qc';
      default:
        return 'title';
    }
  }

}
