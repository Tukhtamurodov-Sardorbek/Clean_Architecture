import 'package:core/core.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppDetails {
  final PackageInfo packageInfo;
  final DeviceInfo deviceInfo;

  const AppDetails(this.packageInfo, this.deviceInfo);

  String get appVersion => packageInfo.version;

  String get deviceId => deviceInfo.deviceId ?? '';

  String get appBuild => packageInfo.buildNumber;

  String get deviceModel => deviceInfo.deviceModel ?? '';

  String get deviceType => deviceInfo.deviceType ?? '';

  String get appLang {
    return LocaleKeys.lang.tr();
  }

  String get deviceOS => deviceInfo.deviceOS ?? '';
}

class DeviceInfo {
  final String? deviceId;
  final String? deviceModel;
  final String? deviceOS;
  final String? deviceType;

  DeviceInfo(this.deviceId, this.deviceModel, this.deviceOS, this.deviceType);
}
