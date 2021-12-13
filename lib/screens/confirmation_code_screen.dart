// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

class ConfimationCodeScreen extends StatefulWidget {
 final String phoneDetail;
  const ConfimationCodeScreen({
    Key? key,
    required this.phoneDetail,
  }) : super(key: key);

  @override
  State<ConfimationCodeScreen> createState() => _ConfimationCodeScreenState();
}

class _ConfimationCodeScreenState extends State<ConfimationCodeScreen> {
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
      body: ListView(
        children: [
          _header(),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: PinFieldAutoFill(
              
              codeLength: 4,
            ),
          ),
        ],
      ),
    );
  }

  void _listenOtp() async {
    await SmsAutoFill().listenForCode();
    print(widget.phoneDetail);
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
