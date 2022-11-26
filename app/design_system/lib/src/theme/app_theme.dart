import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';

class AppTheme {
  AppTheme._();

  static Future<ThemeData> getAppThemeLight() async {
    final themeStr = await rootBundle
        .loadString('packages/design_system/assets/appainter_theme.json');
    return compute(_decodeJsonTheme, themeStr);
  }

  static Future<ThemeData> getAppThemeDark() async {
    final themeStr = await rootBundle.loadString(
        'packages/design_system/assets/appainter_theme_dark.json');
    return compute(_decodeJsonTheme, themeStr);
  }
}

ThemeData _decodeJsonTheme(String themeStr) {
  final themeJson = jsonDecode(themeStr);
  final theme = ThemeDecoder.decodeThemeData(themeJson)!;
  return theme;
}
