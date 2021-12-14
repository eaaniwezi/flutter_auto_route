part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object> get props => [];
}

class NoEvent extends LoginEvent {}

class OnSubmitPhoneNumberEvent extends LoginEvent {
  final String phoneNumber;

  const OnSubmitPhoneNumberEvent({
    required this.phoneNumber,
  });

  @override
  List<Object> get props => [phoneNumber];
}

//*
class CheckCodeEvent extends LoginEvent {
  final String pin;

  const CheckCodeEvent({
    required this.pin,
  });

  @override
  List<Object> get props => [pin];
}

//*
class CreateAccountEvent extends LoginEvent {
  final String newPin;

  const CreateAccountEvent({
    required this.newPin,
  });

  @override
  List<Object> get props => [newPin];
}

//*
class LogOutEvent extends LoginEvent {}