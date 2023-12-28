import 'package:ahad_heyflutter_application/src/ui/generic/widgets/buttons/wide_button.dart';
import 'package:flutter/material.dart';

class ContinueWithCustomButton extends StatelessWidget {
  const ContinueWithCustomButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.buttonText,
  });

  final String buttonText, icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return WideButton(
      onPressed: onPressed,
      buttonText: buttonText,
      prefixIcon: icon,
      customColor: Colors.white70,
      customFontColor: Colors.black,
    );
  }
}
