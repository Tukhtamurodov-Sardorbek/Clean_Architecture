import 'package:flutter/material.dart';

class AppColor {
  static const primaryTextColor = Color(0xFF071222);
  static const Color shimmerBaseColor = Color(0xFFEAECF0);
  static const Color shimmerHighlightColor = Color(0xFFFAFAFD);


  static const int _primaryPrimaryValue = 0xFF2AA65C;
  static const int _primaryAccentValue = 0xFF7AFF9E;
  static const int _secondaryColorPrimaryValue = 0xFFFCB016;
  static const int _secondaryColorAccentValue = 0xFFFFF6EE;
  static const Color greenGradient_2 = Color(0xFF00805F);
  static const int _greyPrimaryValue = 0xFFE0E6EF;

  static const MaterialColor primary = MaterialColor(
      _primaryPrimaryValue,
      <int, Color>{
        50: Color(0xFFE5F4EB),
        100: Color(0xFFBFE4CE),
        200: Color(0xFF95D3AE),
        300: Color(0xFF6AC18D),
        400: Color(0xFF4AB374),
        500: Color(_primaryPrimaryValue),
        600: Color(0xFF259E54),
        700: Color(0xFF1F954A),
        800: Color(0xFF198B41),
        900: Color(0xFF0F7B30),
      },
  );

  static const MaterialColor primaryAccent = MaterialColor(
      _primaryAccentValue,
      <int, Color>{
        100: Color(0xFFADFFC3),
        200: Color(_primaryAccentValue),
        400: Color(0xFF47FF78),
        700: Color(0xFF2EFF65),
      },
  );

  static const MaterialColor secondaryColor = MaterialColor(
      _secondaryColorPrimaryValue,
      <int, Color>{
        50: Color(0xFFFFF6E3),
        100: Color(0xFFFEE7B9),
        200: Color(0xFFFED88B),
        300: Color(0xFFFDC85C),
        400: Color(0xFFFCBC39),
        500: Color(_secondaryColorPrimaryValue),
        600: Color(0xFFFCA913),
        700: Color(0xFFFBA010),
        800: Color(0xFFFB970C),
        900: Color(0xFFFA8706),
      },
  );

  static const MaterialColor secondaryColorAccent = MaterialColor(
      _secondaryColorAccentValue,
      <int, Color>{
        100: Color(0xFFFFFFFF),
        200: Color(_secondaryColorAccentValue),
        400: Color(0xFFFFDCBB),
        700: Color(0xFFFFCFA2),
      },
  );

  static const MaterialColor grey = MaterialColor(
      _greyPrimaryValue,
      <int, Color>{
        50: Color(0xFFFBFCFD),
        100: Color(0xFFF6F8FA),
        200: Color(0xFFF0F3F7),
        300: Color(0xFFE9EEF4),
        400: Color(0xFFE5EAF1),
        500: Color(_greyPrimaryValue),
        600: Color(0xFFDCE3ED),
        700: Color(0xFFD8DFEB),
        800: Color(0xFFD3DBE8),
        900: Color(0xFFCBD5E4),
      },
  );
}
