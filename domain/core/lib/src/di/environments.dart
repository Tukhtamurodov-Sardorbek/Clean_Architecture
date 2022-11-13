import 'package:core/core.dart';

enum Flavor {
  prod,
  beta,
  dev,
  mock
}

const Environment envMock = Environment('mock');
const Environment envDev = Environment('dev');
const Environment envBeta = Environment('beta');
const Environment envProd = Environment('prod');
