import 'package:ahad_heyflutter_application/src/ui/features/onboarding/onboarding_view/onboarding_screen_text.dart';
import 'package:ahad_heyflutter_application/src/ui/features/onboarding/onboarding_view/onboarding_widgets/onboarding_base_wrapper.dart';
import 'package:ahad_heyflutter_application/src/ui/generic/constants/decorations.dart';
import 'package:ahad_heyflutter_application/src/ui/generic/constants/spaces.dart';
import 'package:flutter/material.dart';

import '../../../../generic/constants/font_sizes.dart';
import '../../../../generic/constants/theme_colors.dart';
import '../../../../generic/helper_functions/validator.dart';
import '../../../../generic/widgets/buttons/wide_button.dart';
import '../../../../generic/widgets/spacers/height_spacer.dart';
import '../../../../generic/widgets/texts/generic_text.dart';
import '../../../../generic/widgets/texts/generic_text_field.dart';
import '../../onboarding_view_model/user_bloc_helper.dart';
import '../onboarding_widgets/backdrop_container.dart';
import '../onboarding_widgets/large_heading_text.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments! as Map<String, dynamic>;
    final String email = args['email'];
    return OnboardingBaseWrapper(
      children: [
        const LargeHeadingText(
          OnboardingScreensText.signUp,
        ),
        const HeightSpacer(),
        BackdropContainer(
          children: [
            Padding(
              padding: Decorations.kBorderMargin,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GenericText(
                    OnboardingScreensText.yourDontHaveAnAccountText,
                    style: FontSizes.size16Regular(
                      color: Colors.grey,
                    ),
                  ),
                  GenericText(
                    email,
                    style: FontSizes.size16Regular(
                      color: Colors.white,
                    ),
                  ),
                  HeightSpacer(
                    space: Spaces.defaultSpacingVertical * 2,
                  ),
                ],
              ),
            ),
            _SignUpScreenForm(
              email: email,
            ),
          ],
        ),
      ],
    );
  }
}

class _SignUpScreenForm extends StatefulWidget {
  const _SignUpScreenForm({
    required this.email,
  });
  final String email;

  @override
  State<_SignUpScreenForm> createState() => __SignUpScreenFormState();
}

class __SignUpScreenFormState extends State<_SignUpScreenForm> {
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: signUpFormKey,
      child: Column(
        children: [
          GenericTextField(
            hintText: OnboardingScreensText.name,
            controller: nameController,
            keyboadType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
            inputFormatters: FieldValidator.nameInputFormatter(),
            validator: (val) => FieldValidator.fullNameValidator(val!),
            onChanged: (val) {
              signUpFormKey.currentState!.validate();
            },
          ),
          const HeightSpacer(),
          GenericTextField(
            hintText: OnboardingScreensText.password,
            controller: passwordController,
            isPasswordField: true,
            keyboadType: TextInputType.visiblePassword,
            validator: (val) =>
                FieldValidator.passwordFieldSignUpValidator(val!),
            onChanged: (val) {
              signUpFormKey.currentState!.validate();
            },
          ),
          HeightSpacer(
            space: Spaces.defaultSpacingVertical * 2,
          ),
          Padding(
            padding: Decorations.kBorderMargin,
            child: Text.rich(
              TextSpan(
                text: OnboardingScreensText.bySelectingAgreeText,
                style: FontSizes.size16Regular(
                  color: Colors.white,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: OnboardingScreensText.termsOfServiceAndPrivacyPolicy,
                    style: FontSizes.size16Regular(
                      color: ThemeColors.kThemeColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          HeightSpacer(
            space: Spaces.defaultSpacingVertical * 2,
          ),
          WideButton(
            buttonText: OnboardingScreensText.agreeAndContinue,
            onPressed: () {
              if (signUpFormKey.currentState!.validate()) {
                UserBlocHelper.signUpUser(
                    email: widget.email,
                    fullName: nameController.text,
                    password: passwordController.text);
              }
            },
          ),
          const HeightSpacer(),
        ],
      ),
    );
  }
}
