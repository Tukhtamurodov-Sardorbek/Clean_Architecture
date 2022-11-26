import 'package:core/core.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';

@module
abstract class CoreModule {
  @lazySingleton
  @preResolve
  Future<PackageInfo> providePackageInfo() async {
    return PackageInfo.fromPlatform();
  }

  @developmentEnv
  @betaEnv
  @mockEnv
  @lazySingleton
  Alice provideAliceDev() {
    final Alice alice = Alice();
    return alice;
  }

  @productionEnv
  @lazySingleton
  Alice provideAliceProd() {
    throw MissingPluginException();
  }
}
