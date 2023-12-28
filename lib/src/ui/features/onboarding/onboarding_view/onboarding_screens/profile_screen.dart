import 'package:ahad_heyflutter_application/src/ui/features/onboarding/onboarding_view/onboarding_widgets/onboarding_base_wrapper.dart';
import 'package:flutter/material.dart';

import '../onboarding_widgets/large_heading_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnboardingBaseWrapper(
      children: [
        LargeHeadingText(
          'Profile',
        ),
      ],
    );
  }
}
