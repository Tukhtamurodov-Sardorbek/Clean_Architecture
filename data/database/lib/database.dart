library database;

import 'package:core/core.dart';
import 'package:database/src/di/init.dart';

export 'src/hive_flutter/database.dart';
export 'src/secure_storage/storage.dart';

class Database {
  static inject(GetIt inject, String? environment) =>
      configureInjection(inject, environment);
}