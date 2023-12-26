import 'package:flutter/material.dart';

import '../../generic/constants/theme_colors.dart';

class AppThemeConfig {
  final String themeStorageKey = 'theme';
  final ThemeData _theme = ThemeData(
    primaryColor: ThemeColors.kThemeColor,
    scaffoldBackgroundColor: ThemeColors.kScaffoldBackgroundColor,
    fontFamily: 'Poppins',
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
      },
    ),
  );

  ThemeData getThemeData() {
    return _theme;
  }
}
