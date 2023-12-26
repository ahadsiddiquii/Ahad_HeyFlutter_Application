import 'package:flutter/material.dart';

import '../../../../generic/assets/image_assets.dart';

class OnboardingBaseWrapper extends StatelessWidget {
  const OnboardingBaseWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Image.asset(
          ImageAssets.DUMMY_BACKGROUND_IMAGE,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
