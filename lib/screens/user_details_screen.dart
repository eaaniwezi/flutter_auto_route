import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_with_auto_route/bloc/login_bloc.dart';
import 'package:test_task_with_auto_route/models/login_data.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is UserAuthenticated) {
          LoginData userLoginData = state.data;
          return Scaffold(
            backgroundColor: Colors.white,
            // appBar: AppBar(
            //   elevation: 0,
            //   backgroundColor: Colors.white,
            //   leading: Text(""),
            //   actions: [
            //     IconButton(
            //       onPressed: () {
            //           context
            //     .read<LoginBloc>()
            //     .add(LogOutEvent());
   
            //       },
            //       icon: Icon(
            //         Icons.logout_rounded,
            //         color: Colors.black,
            //       ),
            //     ),
            //   ],
            // ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "ваш номер телефона ",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          userLoginData.phoneNumber!,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "ваш пин-код ",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          userLoginData.code!,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "ваш PIN-код для подтверждения ",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          userLoginData.verificationCode!,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
        return Text("");
      },
    );
  }
}
