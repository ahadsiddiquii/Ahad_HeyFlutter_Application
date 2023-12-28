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
  static const double kWideButtonBorderRadius = 10;
  static const double kWideButtonHeight = 55;
  static const double kFieldIconHeight = 20;
  static const double kFieldIconWidth = 50;
  static const double kFieldIconVerticalPadding = 15;
  static const double kFieldIconHorizontalPadding = 10;
  static const double kTextFieldVerticalContentPadding = 20;

  // Text Field Outline Input Border
  static OutlineInputBorder fieldOutlineBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: Colors.transparent,
    ),
    borderRadius: BorderRadius.circular(
      kWideButtonBorderRadius,
    ),
  );

  //Dialog box decorations
  static const double kDialogBoxBottomPadding = 14;
  static const double kDialogBoxIconBLRPadding = 14;
  static const double kDialogBoxRadius = 15;
  static const double kDialogBackgroundOpacity = 15;
}
