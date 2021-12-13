import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_task_with_auto_route/repository/auth_repository%20.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc({
    required LoginInitial initState,
    required this.authRepository,
  })  : assert(authRepository != null),
        super(initState);

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is OnSubmitPhoneNumberEvent) {
      await authRepository.persistLogin(event.phoneNumber);
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
      final token = authRepository.createAccount(
        event.newPin,
        event.phoneNumber,
      );
      await authRepository.persistLogin(token);
    }
  }
}
