import 'package:flutter/material.dart';
import 'package:database/src/secure_storage/storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppStorageImpl implements AppStorage{
  final FlutterSecureStorage _storage;
  const AppStorageImpl(this._storage);

  /// * Keys
  static const _themeKey = 'THEME_MODE';
  static const _refreshTokenKey = 'REFRESH_TOKEN';

  /// * WRITE
  @override
  Future<void> setTheme(ThemeMode themeMode) async {
    return _storage.write(key: _themeKey, value: themeMode.name);
  }

  @override
  Future<void> setRefreshToken(String token) {
    return _storage.write(key: _refreshTokenKey, value: token);
  }

  /// * READ
  @override
  ThemeMode getTheme() {
    final themeMode = _storage.read(key: _themeKey);
    final theme = ThemeMode.values.firstWhere(
      (theme) => theme.name == themeMode,
      orElse: () => ThemeMode.system,
    );
    return theme;
  }
  @override
  Future<String?> getRefreshToken() async {
    final value = await _storage.read(key: _refreshTokenKey);
    return value;
  }

  /// * DELETE
  @override
  Future<void> deleteTheme() {
    return _storage.delete(key: _themeKey);
  }
  @override
  Future<void> deleteRefreshToken() {
    return _storage.delete(key: _refreshTokenKey);
  }
  @override
  Future<void> deleteAll() {
    return _storage.deleteAll();
  }
}