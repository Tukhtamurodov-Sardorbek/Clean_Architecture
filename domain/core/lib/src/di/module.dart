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

  @envDev
  @envBeta
  @envMock
  @lazySingleton
  Alice provideAliceDev() {
    final Alice alice = Alice();
    return alice;
  }

  @envProd
  @lazySingleton
  Alice provideAliceProd() {
    throw MissingPluginException();
  }
}
