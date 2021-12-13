part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthEvent {}

class UserIsLoggedIn extends AuthEvent {
  final String token;

  const UserIsLoggedIn({required this.token});

  @override
  List<Object> get props => [token];
}

class UserIsLoggedOut extends AuthEvent {}
