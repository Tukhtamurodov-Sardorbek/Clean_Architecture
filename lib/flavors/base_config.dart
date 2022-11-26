import 'package:core/core.dart';

mixin F {
  static late Flavor appFlavor;

  static String get name => appFlavor.name;

  static String get appName {
    switch (appFlavor) {
      case Flavor.Production:
        return 'Clean Architecture';
      case Flavor.Beta:
        return 'Clean Architecture.beta';
      case Flavor.Development:
        return 'Clean Architecture.dev';
      case Flavor.Mock:
        return 'Clean Architecture.mock';
      default:
        return 'Clean Architecture';
    }
  }

  static Environment get appEnvironment {
    switch (appFlavor) {
      case Flavor.Production:
        return productionEnv;
      case Flavor.Beta:
        return betaEnv;
      case Flavor.Development:
        return developmentEnv;
      case Flavor.Mock:
        return mockEnv;
    }
  }
}
