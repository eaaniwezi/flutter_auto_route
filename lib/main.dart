// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_with_auto_route/bloc/login_bloc.dart';
import 'package:test_task_with_auto_route/repository/auth_repository%20.dart';
import 'package:test_task_with_auto_route/routes/app_router.gr.dart';

import 'routes/app_router.dart';

Future<void> main() async {
  final authRepository = await AuthRepository.init();
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
  // final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routerDelegate: _appRouter.delegate(),
      // routeInformationParser: _appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
      title: 'Test App',
    );
  }
}
