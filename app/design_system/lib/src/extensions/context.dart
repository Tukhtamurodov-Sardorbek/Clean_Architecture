import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension ContextExt on BuildContext {
  SystemUiOverlayStyle getSystemUiOverlayStyle() {
    switch (Theme.of(this).brightness) {
      case Brightness.dark:
        return SystemUiOverlayStyle.light;
      case Brightness.light:
        return SystemUiOverlayStyle.dark;
    }
  }
}
