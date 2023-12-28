part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

final class ResetStateToUserInitial extends UserEvent {}

final class MakeUserLoad extends UserEvent {}

final class MakeUserLoggedIn extends UserEvent {
  MakeUserLoggedIn({
    required this.user,
  });
  final User user;
}

final class LogoutUser extends UserEvent {}
