import 'package:flutter/material.dart';

import '../../configs/screen_config.dart';

class Decorations {
  Decorations._();

  static double maxWidth = 1200;

  //Margin Constants
  static final double kBorderMarginValue = ScreenConfig.screenSizeWidth * 0.05;

  static final EdgeInsets kBorderMargin = EdgeInsets.symmetric(
    horizontal: kBorderMarginValue,
  );

  //Wide Button Constants and Text Field Constants
  static const double kWideButtonBorderRadius = 26.5;
  static const double kWideButtonHeight = 49;
}
