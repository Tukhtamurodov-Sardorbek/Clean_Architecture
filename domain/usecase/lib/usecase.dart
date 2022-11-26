library usecase;

import 'package:core/core.dart';
import 'package:usecase/src/di/init.dart';

class UseCase {
  static inject(GetIt inject, String? environment) =>
      configureInjection(inject, environment);
}
