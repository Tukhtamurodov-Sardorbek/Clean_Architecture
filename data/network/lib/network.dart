library network;

import 'package:core/core.dart';
import 'package:network/src/di/init.dart';

class Network {
  static inject(GetIt inject, String? environment) =>
      configureInjection(inject, environment);
}
