import 'package:core/core.dart';

GetIt get locator => GetIt.instance();

@InjectableInit()
void configureDependencies(String environment) =>
    $initGetIt(locator, environment: environment);
