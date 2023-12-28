import 'package:ahad_heyflutter_application/src/ui/generic/context/app_context.dart';
import 'package:flutter/material.dart';

import '../../../../../configs/router/routes.dart';
import '../../../../../generic/helper_functions/loader/loader_service.dart';
import '../../../../../generic/helper_functions/response_popup_service.dart';
import '../../../onboarding_view_model/user_bloc_helper.dart';
import '../user.dart';
import 'user_firestore_service.dart';

class UserFirestoreServiceHelper {
  static final UserFirestoreService _userFirestoreService =
      UserFirestoreService();

  static Future<bool> checkIfUserExists({
    required String email,
  }) async {
    bool userFound = false;
    try {
      LoaderService.setContextSafeLoader(
        startLoader: true,
        loaderKeyForBloc: 'checkIfUserExists',
      );
      UserBlocHelper.setUserBlocToLoading();
      final User? user = await _userFirestoreService.userExists(
        email: email,
      );
      if (user != null) {
        userFound = true;
        UserBlocHelper.setUserBlocToLoggedIn(user);
        LoaderService.setContextSafeLoader(
          startLoader: false,
          loaderKeyForBloc: 'checkIfUserExists',
        );
        appContext.runContextSafeFunction(() {
          Navigator.pushNamed(
            appContext.getContext()!,
            CustomRouter.loginScreenRouteName,
          );
        });
      } else {
        userFound = false;
        UserBlocHelper.setUserBlocToInitial();
        LoaderService.setContextSafeLoader(
          startLoader: false,
          loaderKeyForBloc: 'checkIfUserExists',
        );
        appContext.runContextSafeFunction(() {
          Navigator.pushNamed(
            appContext.getContext()!,
            CustomRouter.signUpScreenRouteName,
            arguments: {
              'email': email,
            },
          );
        });
      }

      return userFound;
    } catch (e) {
      ResponsePopUpService.showFailedSnackBar();
      LoaderService.setContextSafeLoader(
        startLoader: false,
        loaderKeyForBloc: 'checkIfUserExists',
      );
      return userFound;
    }
  }

  static Future<bool> signUp({
    required String email,
    required String fullName,
    required String password,
  }) async {
    bool userAdded = false;
    try {
      LoaderService.setContextSafeLoader(
        startLoader: true,
        loaderKeyForBloc: 'signUp',
      );
      UserBlocHelper.setUserBlocToLoading();
      final User? user = await _userFirestoreService.addUser(
        fullName: fullName,
        email: email,
        password: password,
      );
      if (user != null) {
        userAdded = true;
        UserBlocHelper.setUserBlocToLoggedIn(user);
        LoaderService.setContextSafeLoader(
          startLoader: false,
          loaderKeyForBloc: 'signUp',
        );
        appContext.runContextSafeFunction(() {
          Navigator.pushReplacementNamed(
            appContext.getContext()!,
            CustomRouter.profileScreenRouteName,
          );
        });
      } else {
        userAdded = false;
        LoaderService.setContextSafeLoader(
          startLoader: false,
          loaderKeyForBloc: 'signUp',
        );
        UserBlocHelper.setUserBlocToInitial();
      }

      return userAdded;
    } catch (e) {
      ResponsePopUpService.showFailedSnackBar();
      LoaderService.setContextSafeLoader(
        startLoader: false,
        loaderKeyForBloc: 'signUp',
      );
      return userAdded;
    }
  }
}
