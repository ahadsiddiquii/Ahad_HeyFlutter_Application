import 'package:ahad_heyflutter_application/src/ui/features/onboarding/onboarding_view/onboarding_screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class CustomRouter {
  CustomRouter._();

  //Feature: Onboarding routes
  static const String welcomeScreenRouteName = '/';
  //

  static final Map<String, Widget Function(BuildContext)> routes = {
    //Feature: Onboarding router
    welcomeScreenRouteName: (BuildContext context) => const WelcomeScreen(),
    //
  };
}
