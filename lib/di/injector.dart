import 'package:core/core.dart';
import 'package:flutter_project/di/injector.config.dart';

GetIt get locator => GetIt.instance;

@InjectableInit()
void configureDependencies(String environment) => $initGetIt(
    locator,
    environment: environment,
);
