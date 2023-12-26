import 'package:ahad_heyflutter_application/src/ui/generic/constants/decorations.dart';
import 'package:ahad_heyflutter_application/src/ui/generic/constants/font_sizes.dart';
import 'package:ahad_heyflutter_application/src/ui/generic/widgets/texts/generic_text.dart';
import 'package:flutter/material.dart';

class LargeHeadingText extends StatelessWidget {
  const LargeHeadingText(
    this.text, {
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: Decorations.kBorderMargin,
      child: GenericText(
        text,
        style: FontSizes.size25Bold(
          color: Colors.white,
        ),
      ),
    );
  }
}
