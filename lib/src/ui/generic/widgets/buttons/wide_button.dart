import 'dart:io';

import 'package:ahad_heyflutter_application/src/ui/generic/widgets/texts/generic_text.dart';
import 'package:flutter/material.dart';

import '../../constants/decorations.dart';
import '../../constants/font_sizes.dart';
import '../../constants/theme_colors.dart';

class WideButton extends StatelessWidget {
  const WideButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.needsTranslation = true,
    this.buttonHeight,
    this.buttonWidth,
    this.isTransparent = false,
    this.disableButton = false,
    this.showArrowIcon = false,
    this.customColor = ThemeColors.kThemeColor,
    this.isBottomPadding = true,
    this.borderAlreadyGiven = false,
  });
  final String buttonText;
  final bool needsTranslation;
  final VoidCallback onPressed;
  final bool isTransparent;
  final bool disableButton;
  final bool showArrowIcon;
  final Color customColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final bool isBottomPadding;
  final bool borderAlreadyGiven;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          bottom: Platform.isIOS
              ? isBottomPadding
                  ? 15.0
                  : 0
              : 0),
      margin: (buttonWidth == null && !borderAlreadyGiven)
          ? Decorations.kBorderMargin
          : null,
      child: InkWell(
        splashColor: Colors.grey,
        borderRadius:
            BorderRadius.circular(Decorations.kWideButtonBorderRadius),
        onTap: onPressed,
        //  disableButton ? null : onPressed,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.zero,
              alignment: Alignment.center,
              height: buttonHeight ?? Decorations.kWideButtonHeight,
              width: buttonWidth,
              decoration: BoxDecoration(
                color: disableButton
                    ? ThemeColors.kButtonSecondaryColor
                    : isTransparent
                        ? Colors.transparent
                        : customColor.withOpacity(0.9),
                borderRadius:
                    BorderRadius.circular(Decorations.kWideButtonBorderRadius),
                border: isTransparent
                    ? Border.all(
                        color: customColor,
                      )
                    : null,
              ),
              child: GenericText(
                buttonText,
                style: FontSizes.primaryWideButtonTextStyle.copyWith(
                  color: disableButton
                      ? ThemeColors.kButtonTextSecondaryColor
                      : isTransparent
                          ? customColor
                          : ThemeColors.kButtonTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
