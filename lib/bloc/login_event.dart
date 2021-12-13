part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

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
  final String phoneNumber;

  const CreateAccountEvent({
    required this.newPin,
    required this.phoneNumber,
  });

  @override
  List<Object> get props => [newPin, phoneNumber];
}
