part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserLoggedIn extends UserState {
  UserLoggedIn({
    required this.user,
  });
  final User user;
}
