// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:package_info_plus/package_info_plus.dart' as _i4;

import '../../core.dart' as _i3;
import 'module.dart' as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final coreModule = _$CoreModule();
  await gh.lazySingletonAsync<_i3.DeviceInfo>(
    () => coreModule.provideDeviceInfo(),
    preResolve: true,
  );
  await gh.lazySingletonAsync<_i4.PackageInfo>(
    () => coreModule.providePackageInfo(),
    preResolve: true,
  );
  gh.lazySingleton<_i3.AppDetails>(() => coreModule.provideAppDetails(
        get<_i4.PackageInfo>(),
        get<_i3.DeviceInfo>(),
      ));
  return get;
}

class _$CoreModule extends _i5.CoreModule {}
