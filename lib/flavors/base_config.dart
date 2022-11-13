import 'package:core/core.dart';

mixin F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? 'Flavor';

  static String get appName {
    switch (appFlavor) {
      case Flavor.prod:
        return 'Clean Architecture';
      case Flavor.beta:
        return 'Clean Architecture.beta';
      case Flavor.dev:
        return 'Clean Architecture.dev';
      case Flavor.mock:
        return 'Clean Architecture.mock';
      default:
        return 'Clean Architecture';
    }
  }
}
