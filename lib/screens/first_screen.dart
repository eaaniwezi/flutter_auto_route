// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

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
      body: ListView(
        children: [
          _header(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              cursorColor: Colors.indigo[900],
              style: TextStyle(
                fontSize: 25,
              ),
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                // enabledBorder: InputBorder.none,
                
              ),
            ),
          )
        ],
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
}
