// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:test_task_with_auto_route/bloc/login_bloc.dart';
import 'package:test_task_with_auto_route/screens/create_new_password_screen.dart';
import 'package:test_task_with_auto_route/widget/button.dart';

class ConfimationCodeScreen extends StatefulWidget {
  const ConfimationCodeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ConfimationCodeScreen> createState() => _ConfimationCodeScreenState();
}

class _ConfimationCodeScreenState extends State<ConfimationCodeScreen> {
  final _formKeys = GlobalKey<FormState>();
  TextEditingController codeController = TextEditingController();
  String enteredCode = "";
  bool isCodeTrue = false;
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
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black38,
          ),
        ),
      ),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is CorrectCodeState) {
            Get.to(() => CreateNewPasswordScreen());
            // context.router.navigate(ConfimationCodeRoute());
          } else if (state is WrongCodeState) {
            setState(() {
              isCodeTrue = true;
            });
          }
        },
        child: Form(
          key: _formKeys,
          child: ListView(
            children: [
              _header(),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: PinFieldAutoFill(
                  decoration: UnderlineDecoration(
                    colorBuilder: isCodeTrue == false
                        ? FixedColorBuilder(Colors.black)
                        : FixedColorBuilder(Colors.red),
                  ),
                  controller: codeController,
                  codeLength: 4,
                ),
              ),
              _wrongCodeInfo(),
              ButtonContainer(
                label: "Продолжить",
                onPressed: () async {
                  if (codeController.text.length == 4) {
                    var enteredCode = codeController.text;
                    context
                        .read<LoginBloc>()
                        .add(CheckCodeEvent(pin: enteredCode));
                  } else if (codeController.text.length != 4) {
                    ;
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _wrongCodeInfo() {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is WrongCodeState) ;
      },
      builder: (context, state) {
        if (state is WrongCodeState) {
          return Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 10,
              top: 10,
              bottom: 15,
            ),
            child: Text(
              "Неправильный код.\nПовторите пожалуйста еще раз.",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          );
        }
        return Text("");
      },
    );
  }

  void _listenOtp() async {
    await SmsAutoFill().listenForCode();
  }

  _header() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(
        "Код из сообщения",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 27,
        ),
      ),
    );
  }
}
