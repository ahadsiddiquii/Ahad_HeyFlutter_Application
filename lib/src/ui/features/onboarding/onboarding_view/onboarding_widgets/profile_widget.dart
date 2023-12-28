import 'package:ahad_heyflutter_application/src/ui/generic/assets/image_assets.dart';
import 'package:ahad_heyflutter_application/src/ui/generic/constants/decorations.dart';
import 'package:ahad_heyflutter_application/src/ui/generic/constants/spaces.dart';
import 'package:ahad_heyflutter_application/src/ui/generic/widgets/spacers/width_spacer.dart';
import 'package:flutter/material.dart';

import '../../../../generic/constants/font_sizes.dart';
import '../../../../generic/widgets/texts/generic_text.dart';

class ProfileDisplay extends StatelessWidget {
  const ProfileDisplay({
    super.key,
    required this.userName,
    required this.email,
  });
  final String userName;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Decorations.kBorderMargin,
      child: Row(
        children: [
          SizedBox(
            height: 80,
            width: 80,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  100,
                ),
              ),
              child: Image.asset(
                ImageAssets.dummyProfileImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          WidthSpacer(
            space: Spaces.defaultSpacingHorizontal * 2,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GenericText(
                userName,
                style: FontSizes.size18SemiBold(
                  color: Colors.white,
                ),
              ),
              GenericText(
                email,
                style: FontSizes.size16Regular(
                  color: Colors.grey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
