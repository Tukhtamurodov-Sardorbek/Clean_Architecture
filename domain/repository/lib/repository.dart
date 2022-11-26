library repository;

import 'package:core/core.dart';
import 'package:repository/src/di/init.dart';

class Repository {
  static inject(GetIt inject, String? environment) =>
      configureInjection(inject, environment);
}
