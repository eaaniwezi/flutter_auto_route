// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:test_task_with_auto_route/bloc/login_bloc.dart';
import 'package:test_task_with_auto_route/screens/user_details_screen.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final _formPasswordKey = GlobalKey<FormState>();
  TextEditingController newCodeController = TextEditingController();
  String enteredCode = "";
  @override
  void initState() {
    super.initState();

    _listenOtp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            // Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black38,
          ),
        ),
      ),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
        
          if (state is UserAuthenticated) {
            Get.to(() => UserDetailsScreen());
          }
        },
        child: Form(
          key: _formPasswordKey,
          child: ListView(
            children: [
              _header(),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: PinFieldAutoFill(
                  controller: newCodeController,
                  codeLength: 4,
                ),
              ),
              _button(context),
            ],
          ),
        ),
      ),
    );
  }

  _button(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 40,
        right: 40,
        top: MediaQuery.of(context).size.height * 0.15,
        bottom: 15,
      ),
      child: InkWell(
        onTap: () async {
          if (newCodeController.text.length == 4) {
            var enteredCode = newCodeController.text;
            context
                .read<LoginBloc>()
                .add(CreateAccountEvent(newPin: enteredCode));
          } else if (newCodeController.text.length != 4) {}
        },
        child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.indigo[900]!.withOpacity(0.9),
              borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: Text(
              "Продолжить",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _listenOtp() async {
    await SmsAutoFill().listenForCode();
  }

  _header() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(
        "Задайте пароль",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 27,
        ),
      ),
    );
  }
}
