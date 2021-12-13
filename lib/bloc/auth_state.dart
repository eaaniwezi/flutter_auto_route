part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class UserUninitialized extends AuthState {}

class UserAuthenticated extends AuthState {}

class UserUnauthenticated extends AuthState {}

class UserLoading extends AuthState {}
