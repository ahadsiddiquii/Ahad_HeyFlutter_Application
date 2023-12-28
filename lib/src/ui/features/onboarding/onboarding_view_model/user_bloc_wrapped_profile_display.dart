import 'package:ahad_heyflutter_application/src/ui/features/onboarding/onboarding_view/onboarding_widgets/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../onboarding_model/user/user_bloc/user_bloc.dart';

class UserBlocWrappedProfileDisplay extends StatelessWidget {
  const UserBlocWrappedProfileDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, userBlocState) {
        if (userBlocState is UserLoggedIn) {
          return ProfileDisplay(
            userName: userBlocState.user.fullName,
            email: userBlocState.user.email,
          );
        }
        return const SizedBox();
      },
    );
  }
}
