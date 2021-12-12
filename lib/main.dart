// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_task_with_auto_route/screens/first_screen.dart';

void main() {
  runApp(const MyApp());
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
