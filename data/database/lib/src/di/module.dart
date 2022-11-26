import 'package:core/core.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:database/src/secure_storage/storage.dart';
import 'package:database/src/secure_storage/storage_impl.dart';
import 'package:database/src/hive_flutter/database.dart';
import 'package:database/src/hive_flutter/database_impl.dart';

@module
abstract class DatabaseModule {
  @singleton
  FlutterSecureStorage secureStorage() => const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  // @preResolve
  // Future<Hive> get prefs => /// TODO: get hive instance


  @singleton
  AppStorage provideAppStorage(FlutterSecureStorage secureStorage) =>
      AppStorageImpl(secureStorage);

  @singleton
  AppDatabase provideAppDatabase() => AppDatabaseImpl();
}
