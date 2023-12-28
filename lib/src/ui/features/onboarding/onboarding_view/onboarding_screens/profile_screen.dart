import 'package:ahad_heyflutter_application/src/ui/features/onboarding/onboarding_view/onboarding_widgets/onboarding_base_wrapper.dart';
import 'package:ahad_heyflutter_application/src/ui/features/onboarding/onboarding_view_model/user_bloc_wrapped_profile_display.dart';
import 'package:flutter/material.dart';

import '../../../../generic/widgets/spacers/height_spacer.dart';
import '../onboarding_widgets/backdrop_container.dart';
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
        HeightSpacer(),
        BackdropContainer(
          children: [
            UserBlocWrappedProfileDisplay(),
          ],
        ),
      ],
    );
  }
}
