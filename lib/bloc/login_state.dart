part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class SubmitPhoneNumberState extends LoginState {}

class CorrectCodeState extends LoginState {}

class WrongCodeState extends LoginState {}

class CreateAccountState extends LoginState {}

class UserAuthenticated extends LoginState {
  final LoginData data;
  UserAuthenticated(this.data);
}

class UserUnauthenticated extends LoginState {}
