import 'package:ahad_heyflutter_application/src/ui/features/onboarding/onboarding_view/onboarding_widgets/onboarding_base_wrapper.dart';
import 'package:ahad_heyflutter_application/src/ui/features/onboarding/onboarding_view_model/user_bloc_helper.dart';
import 'package:ahad_heyflutter_application/src/ui/generic/constants/spaces.dart';
import 'package:flutter/material.dart';

import '../../../../configs/router/routes.dart';
import '../../../../generic/constants/decorations.dart';
import '../../../../generic/helper_functions/validator.dart';
import '../../../../generic/widgets/buttons/wide_button.dart';
import '../../../../generic/widgets/spacers/height_spacer.dart';
import '../../../../generic/widgets/texts/generic_text_field.dart';
import '../../onboarding_view_model/user_bloc_wrapped_profile_display.dart';
import '../onboarding_screen_text.dart';
import '../onboarding_widgets/backdrop_container.dart';
import '../onboarding_widgets/forgot_password_button.dart';
import '../onboarding_widgets/large_heading_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingBaseWrapper(
      children: [
        const LargeHeadingText(
          OnboardingScreensText.logIn,
        ),
        const HeightSpacer(),
        BackdropContainer(
          children: [
            HeightSpacer(
              space: Spaces.labelSpacingVertical,
            ),
            const UserBlocWrappedProfileDisplay(),
            HeightSpacer(
              space: Spaces.defaultSpacingVertical * 2,
            ),
            const _LoginScreenForm(),
            HeightSpacer(
              space: Spaces.defaultSpacingVertical * 2,
            ),
            Container(
              padding: Decorations.kBorderMargin,
              alignment: Alignment.centerLeft,
              child: const ForgotPasswordButton(),
            ),
          ],
        ),
      ],
    );
  }
}

class _LoginScreenForm extends StatefulWidget {
  const _LoginScreenForm();

  @override
  State<_LoginScreenForm> createState() => __LoginScreenFormState();
}

class __LoginScreenFormState extends State<_LoginScreenForm> {
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> loginScreenFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginScreenFormKey,
      child: Column(
        children: [
          GenericTextField(
            hintText: 'Password',
            controller: passwordController,
            isPasswordField: true,
            keyboadType: TextInputType.visiblePassword,
            validator: (val) => FieldValidator.passwordFieldSigninValidator(
              val!,
              UserBlocHelper.getPasswordFromUserBloc(),
            ),
            onChanged: (val) {
              loginScreenFormKey.currentState!.validate();
            },
          ),
          const HeightSpacer(),
          WideButton(
            buttonText: OnboardingScreensText.continueText,
            onPressed: () {
              if (loginScreenFormKey.currentState!.validate()) {
                Navigator.pushReplacementNamed(
                  context,
                  CustomRouter.profileScreenRouteName,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
