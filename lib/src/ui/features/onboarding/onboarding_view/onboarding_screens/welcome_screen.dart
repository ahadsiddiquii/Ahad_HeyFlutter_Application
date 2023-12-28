import 'package:ahad_heyflutter_application/src/ui/features/onboarding/onboarding_view/onboarding_widgets/continue_with_custom_button.dart';
import 'package:ahad_heyflutter_application/src/ui/features/onboarding/onboarding_view/onboarding_widgets/large_heading_text.dart';
import 'package:ahad_heyflutter_application/src/ui/features/onboarding/onboarding_view/onboarding_widgets/onboarding_base_wrapper.dart';
import 'package:ahad_heyflutter_application/src/ui/features/onboarding/onboarding_view_model/user_bloc_helper.dart';
import 'package:ahad_heyflutter_application/src/ui/generic/assets/icon_assets.dart';
import 'package:ahad_heyflutter_application/src/ui/generic/constants/spaces.dart';
import 'package:ahad_heyflutter_application/src/ui/generic/constants/theme_colors.dart';
import 'package:ahad_heyflutter_application/src/ui/generic/widgets/buttons/wide_button.dart';
import 'package:ahad_heyflutter_application/src/ui/generic/widgets/spacers/height_spacer.dart';
import 'package:ahad_heyflutter_application/src/ui/generic/widgets/spacers/width_spacer.dart';
import 'package:ahad_heyflutter_application/src/ui/generic/widgets/texts/generic_text_field.dart';
import 'package:flutter/material.dart';

import '../../../../configs/router/routes.dart';
import '../../../../generic/constants/decorations.dart';
import '../../../../generic/constants/font_sizes.dart';
import '../../../../generic/context/app_context.dart';
import '../../../../generic/helper_functions/validator.dart';
import '../../../../generic/widgets/texts/generic_text.dart';
import '../onboarding_screen_text.dart';
import '../onboarding_widgets/backdrop_container.dart';
import '../onboarding_widgets/forgot_password_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    appContext.context = context;
    return const OnboardingBaseWrapper(
      children: [
        LargeHeadingText(
          OnboardingScreensText.hi,
        ),
        HeightSpacer(),
        BackdropContainer(
          children: [
            HeightSpacer(),
            _WelcomeScreenForm(),
          ],
        ),
      ],
    );
  }
}

class _WelcomeScreenForm extends StatefulWidget {
  const _WelcomeScreenForm();

  @override
  State<_WelcomeScreenForm> createState() => __WelcomeScreenFormState();
}

class __WelcomeScreenFormState extends State<_WelcomeScreenForm> {
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          GenericTextField(
            hintText: OnboardingScreensText.email,
            controller: emailController,
            keyboadType: TextInputType.emailAddress,
            inputFormatters: FieldValidator.emailInputFormatter(),
            validator: (val) => FieldValidator.emailFieldValidator(val!),
            onChanged: (val) {
              formKey.currentState!.validate();
            },
          ),
          const HeightSpacer(),
          WideButton(
            buttonText: OnboardingScreensText.continueText,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                UserBlocHelper.welcomeUserContinueFunction(
                  email: emailController.text,
                );
              }
            },
          ),
          const HeightSpacer(),
          GenericText(
            OnboardingScreensText.or,
            style: FontSizes.size16Regular(
              color: Colors.white,
            ),
          ),
          const HeightSpacer(),
          ContinueWithCustomButton(
            buttonText: OnboardingScreensText.continueWithFacebook,
            icon: IconAssets.facebookLogo,
            onPressed: () {},
          ),
          const HeightSpacer(),
          ContinueWithCustomButton(
            buttonText: OnboardingScreensText.continueWithGoogle,
            icon: IconAssets.googleLogo,
            onPressed: () {},
          ),
          const HeightSpacer(),
          ContinueWithCustomButton(
            buttonText: OnboardingScreensText.continueWithApple,
            icon: IconAssets.appleLogo,
            onPressed: () {},
          ),
          _BottomNavigationPartition(
            emailController: emailController,
            formKey: formKey,
          ),
        ],
      ),
    );
  }
}

class _BottomNavigationPartition extends StatelessWidget {
  const _BottomNavigationPartition({
    required this.emailController,
    required this.formKey,
  });

  final TextEditingController emailController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Decorations.kBorderMargin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeightSpacer(
            space: Spaces.defaultSpacingVertical * 1.5,
          ),
          Row(
            children: [
              GenericText(
                OnboardingScreensText.dontHaveAnAccount,
                style: FontSizes.size16Regular(
                  color: Colors.white,
                ),
              ),
              const WidthSpacer(),
              InkWell(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.pushNamed(
                      context,
                      CustomRouter.signUpScreenRouteName,
                      arguments: {
                        'email': emailController.text,
                      },
                    );
                  }
                },
                child: GenericText(
                  OnboardingScreensText.signUp,
                  style: FontSizes.size16Regular(
                    color: ThemeColors.kThemeColor,
                  ),
                ),
              ),
            ],
          ),
          const HeightSpacer(),
          const ForgotPasswordButton(),
        ],
      ),
    );
  }
}
