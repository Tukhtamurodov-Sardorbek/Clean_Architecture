import 'package:flutter/material.dart';

abstract class AppStorage {
  Future<void> setTheme(ThemeMode themeMode);
  ThemeMode getTheme();
  Future<void> deleteTheme();


  Future<void> setRefreshToken(String token);
  Future<String?> getRefreshToken();
  Future<void> deleteRefreshToken();

  Future<void> deleteAll();
}