import 'package:ahad_heyflutter_application/src/ui/generic/constants/decorations.dart';
import 'package:ahad_heyflutter_application/src/ui/generic/widgets/texts/generic_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../configs/screen_config.dart';
import '../../constants/font_sizes.dart';
import '../../constants/theme_colors.dart';
import '../buttons/wide_button.dart';

Future<VoidCallback?> genericDialogBoxWithWidgets({
  required BuildContext context,
  String? heading,
  String? text,
  String? iconPath,
  List<Widget>? widgets,
  String? button1Text,
  VoidCallback? button1,
  bool barrierDismissable = false,
  bool willPopScope = false,
  VoidCallback? thenFunction,
  Color? barrierColor,
  Color? buttonCustomerColor,
}) {
  return showDialog(
    barrierColor: barrierColor ?? ThemeColors.kThemeColor.withOpacity(0.75),
    context: context,
    barrierDismissible: barrierDismissable,
    builder: (BuildContext context) => WillPopScope(
      onWillPop: () async => willPopScope,
      child: AlertDialog(
        scrollable: true,
        actionsPadding: EdgeInsets.only(
          left: ScreenConfig.screenSizeWidth * 0.1,
          right: ScreenConfig.screenSizeWidth * 0.1,
          bottom: Decorations.kDialogBoxBottomPadding,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            Decorations.kDialogBoxRadius,
          ),
        ),
        title: (iconPath != null || heading != null)
            ? Column(
                children: [
                  if (iconPath != null)
                    Padding(
                      padding: const EdgeInsets.only(
                        left: Decorations.kDialogBoxIconBLRPadding,
                        right: Decorations.kDialogBoxIconBLRPadding,
                        bottom: Decorations.kDialogBoxIconBLRPadding,
                      ),
                      child: SvgPicture.asset(
                        iconPath,
                      ),
                    ),
                  if (heading != null)
                    GenericText(
                      heading,
                      textAlign: TextAlign.center,
                      style: FontSizes.size25Medium(
                        color: ThemeColors.kFontSecondaryBlueColor,
                      ),
                    ),
                ],
              )
            : null,
        content: (text != null || widgets != null)
            ? Column(
                children: [
                  if (text != null)
                    GenericText(
                      text,
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      style: FontSizes.size14Light(
                        color: ThemeColors.kFontPrimaryBlueColor,
                      ),
                    ),
                  if (widgets != null)
                    Column(
                      children: widgets,
                    )
                ],
              )
            : null,
        actionsAlignment: MainAxisAlignment.center,
        actions: (button1Text != null && button1 != null)
            ? [
                WideButton(
                  customColor: buttonCustomerColor ?? ThemeColors.kButtonColor,
                  buttonWidth: ScreenConfig.screenSizeWidth * 0.6,
                  onPressed: () {
                    button1();
                  },
                  buttonText: button1Text,
                )
              ]
            : null,
      ),
    ),
  ).then(
    (value) => thenFunction,
  );
}
