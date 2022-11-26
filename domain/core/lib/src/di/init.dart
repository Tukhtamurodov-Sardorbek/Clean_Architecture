import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

late final GetIt moduleInjection;

@injectableInit
Future<void> configureInjection(GetIt inject, String? environment) async {
  await $initGetIt(inject, environment: environment);
  moduleInjection = inject;
}