// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_with_auto_route/bloc/login_bloc.dart';
import 'package:test_task_with_auto_route/widget/button.dart';
import '../screens/confirmation_code_screen.dart';
// import 'package:auto_route/auto_route.dart';
import 'package:test_task_with_auto_route/routes/app_router.gr.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.black38,
        ),
      ),
      body: Form(
        key: _formKey,
        child: BlocListener<LoginBloc, LoginState>(
          listenWhen: (oldState, newState) =>
              newState is SubmitPhoneNumberState,
          listener: (context, state) {
            if (state is SubmitPhoneNumberState) {
              Get.to(() => ConfimationCodeScreen());
              // context.router.navigate(ConfimationCodeRoute());
            }
          },
          child: ListView(
            children: [
              _header(),
              _numberField(),
              _infoText(),
              ButtonContainer(
                label: "Продолжить",
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final signCode = await SmsAutoFill().getAppSignature;
                    print(signCode);
                    var phoneNumber = phoneNumberController.text;
                    context.read<LoginBloc>().add(
                        OnSubmitPhoneNumberEvent(phoneNumber: phoneNumber));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _header() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(
        "Мой номер телефона",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
    );
  }

  _numberField() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        cursorColor: Color(0xff182647),
        style: TextStyle(
          fontSize: 25,
        ),
        controller: phoneNumberController,
        validator: (value) {
          if (value!.isEmpty) {
            return "Не может быть пустым";
          }
        },
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff182647),
            ),
          ),
        ),
      ),
    );
  }

  _infoText() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Text(
        "Вам придет сообщение с кодом.\nНикому его не говорите.",
        style: TextStyle(
          color: Colors.black45,
        ),
      ),
    );
  }
}
