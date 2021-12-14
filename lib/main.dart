// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:test_task_with_auto_route/bloc/login_bloc.dart';
import 'package:test_task_with_auto_route/repository/auth_repository%20.dart';
import 'package:test_task_with_auto_route/routes/app_router.gr.dart';
import 'package:test_task_with_auto_route/screens/first_screen.dart';
import 'package:test_task_with_auto_route/screens/user_details_screen.dart';

import 'routes/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FlutterSecureStorage storage = new FlutterSecureStorage();
  final authRepository = await AuthRepository.init(storage);
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
    return GetMaterialApp(
      // routerDelegate: _appRouter.delegate(),
      // routeInformationParser: _appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
      title: 'Test App',
      home: Builder(builder: (context) {
        return BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is UserAuthenticated) {
              Get.to(() => UserDetailsScreen());
            } else if (state is UserUnauthenticated) {
              Get.to(() => FirstScreen());
            }
          },
          child: Scaffold(
            body: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Text(
                      "Please wait a while...",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
