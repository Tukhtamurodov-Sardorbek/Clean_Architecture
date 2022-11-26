import 'package:core/core.dart';
import 'package:database/src/di/init.config.dart';

late final GetIt moduleInjection;

@injectableInit
Future<void> configureInjection(GetIt inject, String? environment) async {
  await $initGetIt(inject, environment: environment);
  moduleInjection = inject;
}
