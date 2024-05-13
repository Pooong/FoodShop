enum Flavor {
  prod,
  dev,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.prod:
        return 'Fitness Tracker';
      case Flavor.dev:
        return 'Fitness Tracker DEV';
      default:
        return 'title';
    }
  }

}
