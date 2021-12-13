part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class OnUserLoginButtonPressed extends LoginEvent {
  final String phoneNumber;
  final String codeFromMessage;

  const OnUserLoginButtonPressed({
    required this.phoneNumber,
    required this.codeFromMessage,
  });

  @override
  List<Object> get props => [
        phoneNumber,
        codeFromMessage,
      ];
}
