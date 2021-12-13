import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:test_task_with_auto_route/bloc/auth_bloc.dart';
import 'package:test_task_with_auto_route/repository/auth_repository%20.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;
  final AuthBloc authBloc;

  LoginBloc({
    required LoginInitial initState,
    required this.authRepository,
    required this.authBloc,
  })  : assert(authRepository != null),
        super(initState);

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is OnUserLoginButtonPressed) {
      yield UserLoginLoading();

      final bool isCorrectCode = authRepository.isCodeCorrect(
        event.codeFromMessage,
        event.phoneNumber,
      );
      if (isCorrectCode == true) {
        final token =  authRepository.login(
          event.phoneNumber,
        );
        authBloc.add(UserIsLoggedIn(token: token));
        yield UserLoginInitial();
      }
    }
  }
}
