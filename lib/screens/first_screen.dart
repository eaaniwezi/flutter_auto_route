// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_with_auto_route/bloc/login_bloc.dart';
import 'package:auto_route/auto_route.dart';
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
              // context.router.navigate(ConfimationCodeRoute());
            }
          },
          child: ListView(
            children: [
              _header(),
              _numberField(),
              _infoText(),
              _button(context),
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
        cursorColor: Colors.indigo[900],
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
              color: Colors.deepPurple[900]!.withOpacity(0.9),
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
          if (_formKey.currentState!.validate()) {
            final signCode = await SmsAutoFill().getAppSignature;
            print(signCode);
            var phoneNumber = phoneNumberController.text;
            context
                .read<LoginBloc>()
                .add(OnSubmitPhoneNumberEvent(phoneNumber: phoneNumber));
          }
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
}
