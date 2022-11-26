import 'package:injectable/injectable.dart';

enum Flavor {
  Beta,
  Development,
  Mock,
  Production,
}

const Environment betaEnv = Environment('beta');
const Environment developmentEnv = Environment('dev');
const Environment mockEnv = Environment('mock');
const Environment productionEnv = Environment('prod');
