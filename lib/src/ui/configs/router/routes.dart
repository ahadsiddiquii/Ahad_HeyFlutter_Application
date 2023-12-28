import 'package:ahad_heyflutter_application/src/ui/features/onboarding/onboarding_view/onboarding_screens/login_screen.dart';
import 'package:ahad_heyflutter_application/src/ui/features/onboarding/onboarding_view/onboarding_screens/profile_screen.dart';
import 'package:ahad_heyflutter_application/src/ui/features/onboarding/onboarding_view/onboarding_screens/signup_screen.dart';
import 'package:ahad_heyflutter_application/src/ui/features/onboarding/onboarding_view/onboarding_screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class CustomRouter {
  CustomRouter._();

  //Feature: Onboarding routes
  static const String welcomeScreenRouteName = '/';
  static const String signUpScreenRouteName = '/signup';
  static const String loginScreenRouteName = '/login';
  static const String profileScreenRouteName = '/profile';
  //

  static final Map<String, Widget Function(BuildContext)> routes = {
    //Feature: Onboarding router
    welcomeScreenRouteName: (BuildContext context) => const WelcomeScreen(),
    signUpScreenRouteName: (BuildContext context) => const SignupScreen(),
    loginScreenRouteName: (BuildContext context) => const LoginScreen(),
    profileScreenRouteName: (BuildContext context) => const ProfileScreen(),
    //
  };
}
