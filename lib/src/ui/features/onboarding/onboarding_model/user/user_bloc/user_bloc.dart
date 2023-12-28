import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<MakeUserLoad>((event, emit) {
      emit(UserLoading());
    });

    on<MakeUserLoggedIn>((event, emit) {
      emit(UserLoggedIn(
        user: event.user,
      ));
    });

    on<ResetStateToUserInitial>((event, emit) {
      emit(UserInitial());
    });
  }
}
