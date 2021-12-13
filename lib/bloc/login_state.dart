part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class UserLoginInitial extends LoginState {}

class UserLoginLoading extends LoginState {}

class UserLoginFailure extends LoginState {
  final String error;

  const UserLoginFailure({required this.error});
}
