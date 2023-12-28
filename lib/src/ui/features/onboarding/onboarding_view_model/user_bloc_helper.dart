import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generic/context/app_context.dart';
import '../onboarding_model/user/user.dart';
import '../onboarding_model/user/user_bloc/user_bloc.dart';
import '../onboarding_model/user/user_resources/user_firestore_service_helper.dart';

class UserBlocHelper {
  UserBlocHelper._();

  //Api Functions

  static void welcomeUserContinueFunction({
    required String email,
  }) {
    UserFirestoreServiceHelper.checkIfUserExists(
      email: email,
    );
  }

  static void signUpUser({
    required String email,
    required String fullName,
    required String password,
  }) {
    UserFirestoreServiceHelper.signUp(
      email: email,
      fullName: fullName,
      password: password,
    );
  }

  //Bloc Functions

  static void setUserBlocToLoading() {
    appContext.runContextSafeFunction(
      () {
        BlocProvider.of<UserBloc>(
          appContext.getContext()!,
        ).add(
          MakeUserLoad(),
        );
      },
    );
  }

  static void setUserBlocToLoggedIn(User user) {
    appContext.runContextSafeFunction(
      () {
        BlocProvider.of<UserBloc>(
          appContext.getContext()!,
        ).add(
          MakeUserLoggedIn(
            user: user,
          ),
        );
      },
    );
  }

  static void setUserBlocToInitial() {
    appContext.runContextSafeFunction(
      () {
        BlocProvider.of<UserBloc>(
          appContext.getContext()!,
        ).add(
          ResetStateToUserInitial(),
        );
      },
    );
  }

  static String getPasswordFromUserBloc() {
    String userPassword = ' ';
    appContext.runContextSafeFunction(
      () {
        final userState = BlocProvider.of<UserBloc>(
          appContext.getContext()!,
        ).state;
        if (userState is UserLoggedIn) {
          userPassword = userState.user.password ?? ' ';
        }
      },
    );
    return userPassword;
  }
}
