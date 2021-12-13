// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_with_auto_route/bloc/login_bloc.dart';
import 'package:test_task_with_auto_route/repository/auth_repository%20.dart';
import 'package:test_task_with_auto_route/screens/first_screen.dart';

void main() {
  final authRepository = AuthRepository();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => LoginBloc(
          authRepository: authRepository,
          initState: LoginInitial(),
        ),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const FirstScreen(),
    );
  }
}
