import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/onboarding/onboarding_model/user/user_bloc/user_bloc.dart';

class BlocInitializer extends StatelessWidget {
  const BlocInitializer({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc(),
        ),
      ],
      child: child,
    );
  }
}
