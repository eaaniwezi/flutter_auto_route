// ignore_for_file: file_names, import_of_legacy_library_into_null_safe, unnecessary_new, prefer_const_constructors, unnecessary_null_comparison, avoid_print

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepository {
  final FlutterSecureStorage storage = new FlutterSecureStorage();

  String login(String pin) {
    // const String sendCode = "9323";
    // return sendCode;
    return pin;
  }

  bool isCodeCorrect(String code, String phoneNumber) {
    const String sentCode = "9323";
    if (code == sentCode) {
      return true;
    } else {
      return false;
    }
  }

  

  // bool register(String pin) {
  //   if (pin != null) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  Future<void> persistLogin(String phoneNumber) async {
    await storage.write(key: 'phone', value: phoneNumber);
  }

  Future<bool> hasToken() async {
    var value = await storage.read(key: 'phone');
    print(value);
    if (value != null) {
      return true;
    } else {
      return false;
    }
  }
}