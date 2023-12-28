import 'package:ahad_heyflutter_application/src/ui/generic/widgets/texts/generic_text.dart';
import 'package:flutter/material.dart';

import '../../constants/font_sizes.dart';
import '../../constants/spaces.dart';
import '../../constants/theme_colors.dart';
import '../spacers/height_spacer.dart';

class CircleRoundedLoader extends StatelessWidget {
  const CircleRoundedLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeightSpacer(
          space: Spaces.defaultSpacingVertical * 2,
        ),
        const CircularProgressIndicator(
          color: ThemeColors.kThemeColor,
        ),
        const HeightSpacer(),
        GenericText(
          'Loading ...',
          textAlign: TextAlign.center,
          maxLines: 2,
          style: FontSizes.size14Light(
            color: Colors.black,
          ),
        ),
        const HeightSpacer(),
      ],
    );
  }
}

class CircleRoundedLoaderWithoutText extends StatelessWidget {
  const CircleRoundedLoaderWithoutText({
    super.key,
    this.diameter,
    this.color,
  });
  final double? diameter;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const HeightSpacer(),
        SizedBox(
          height: diameter ?? 40,
          width: diameter ?? 40,
          child: CircularProgressIndicator(
            color: color ?? Colors.black,
          ),
        ),
        const HeightSpacer(),
      ],
    );
  }
}
