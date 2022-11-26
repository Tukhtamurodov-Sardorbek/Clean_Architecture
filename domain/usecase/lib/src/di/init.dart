import 'package:core/core.dart';

late final GetIt moduleInjection;

@injectableInit
Future<void> configureInjection(GetIt inject, String? environment) async {
  $initGetIt(inject, environment: environment);
  moduleInjection = inject;
}