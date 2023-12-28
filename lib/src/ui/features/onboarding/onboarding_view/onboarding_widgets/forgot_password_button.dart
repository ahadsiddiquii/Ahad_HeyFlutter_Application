import 'package:flutter/material.dart';

import '../../../../generic/constants/font_sizes.dart';
import '../../../../generic/constants/theme_colors.dart';
import '../../../../generic/widgets/texts/generic_text.dart';
import '../onboarding_screen_text.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericText(
      OnboardingScreensText.forgotYourPassword,
      style: FontSizes.size16Regular(
        color: ThemeColors.kThemeColor,
      ),
    );
  }
}
