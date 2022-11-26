import 'dart:io';

import 'package:android_id/android_id.dart';
import 'package:core/core.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';

@module
abstract class CoreModule {
  @lazySingleton
  @preResolve
  Future<PackageInfo> providePackageInfo() async {
    return PackageInfo.fromPlatform();
  }

  @lazySingleton
  @preResolve
  Future<DeviceInfo> provideDeviceInfo() async {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      final androidId = await const AndroidId().getId();
      return DeviceInfo(
        androidId,
        '${androidInfo.brand} ${androidInfo.model}',
        Platform.operatingSystemVersion,
        Platform.operatingSystem,
      );
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      return DeviceInfo(
        iosInfo.identifierForVendor,
        iosInfo.model,
        Platform.operatingSystemVersion,
        Platform.operatingSystem,
      );
    }
    throw UnsupportedError('Unsupported device');
  }

  @lazySingleton
  AppDetails provideAppDetails(PackageInfo packageInfo, DeviceInfo deviceInfo) {
    return AppDetails(packageInfo, deviceInfo);
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
