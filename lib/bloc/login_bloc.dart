import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_with_auto_route/models/login_data.dart';
import 'package:test_task_with_auto_route/repository/auth_repository%20.dart';

part 'login_state.dart';
part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc({
    required LoginInitial initState,
    required this.authRepository,
  }) : super(initState) {
    add(NoEvent());
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is OnSubmitPhoneNumberEvent) {
      authRepository.savePhoneNumber(event.phoneNumber);
      yield SubmitPhoneNumberState();
      //!Navigate
    } else if (event is CheckCodeEvent) {
      final isCodeTrue = authRepository.checkPin(event.pin);

      if (isCodeTrue == true) {
        //!yield a state
        yield CorrectCodeState();
        //!Navigate
      } else {
        //!yield a different state
        yield WrongCodeState();
      }
    } else if (event is CreateAccountEvent) {
      await authRepository.saveCode(
        event.newPin,
      );
      yield UserAuthenticated(authRepository.details);
    } else if (event is NoEvent) {
      final bool hasToken = authRepository.details.isValid();
      if (hasToken) {
        yield UserAuthenticated(authRepository.details);
      } else {
        yield UserUnauthenticated();
      }
    }
  }
}
