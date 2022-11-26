// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../hive_flutter/database.dart' as _i3;
import '../secure_storage/storage.dart' as _i5;
import 'module.dart' as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final databaseModule = _$DatabaseModule();
  gh.singleton<_i3.AppDatabase>(databaseModule.provideAppDatabase());
  gh.singleton<_i4.FlutterSecureStorage>(databaseModule.secureStorage());
  gh.singleton<_i5.AppStorage>(
      databaseModule.provideAppStorage(get<_i4.FlutterSecureStorage>()));
  return get;
}

class _$DatabaseModule extends _i6.DatabaseModule {}
