import 'dart:io';

import 'package:core/core.dart';
import 'package:core/src/storage/app_details.dart';
import 'package:device_info_plus/device_info_plus.dart';
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
      return DeviceInfo(
        androidInfo.id,
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
}
