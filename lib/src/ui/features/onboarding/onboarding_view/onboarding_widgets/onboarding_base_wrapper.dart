import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../generic/assets/image_assets.dart';
import '../../../../generic/constants/decorations.dart';
import '../../../../generic/widgets/spacers/height_spacer.dart';

class OnboardingBaseWrapper extends StatelessWidget {
  const OnboardingBaseWrapper({
    super.key,
    required this.children,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.asset(
            ImageAssets.dummyBackgroundImage,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: 1,
                sigmaY: 1), // Adjust the sigma values for the blur intensity
            child: Container(
              color: Colors
                  .transparent, // You can set a background color if needed
            ),
          ),
          Container(
            margin: Decorations.kBorderMargin,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: crossAxisAlignment,
                mainAxisAlignment: mainAxisAlignment,
                children: [
                  Column(
                    children: children,
                  ),
                  const HeightSpacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
