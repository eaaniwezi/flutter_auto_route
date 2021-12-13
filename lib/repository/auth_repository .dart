// ignore_for_file: file_names, import_of_legacy_library_into_null_safe, unnecessary_new, prefer_const_constructors, unnecessary_null_comparison, avoid_print

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepository {
  final FlutterSecureStorage storage = new FlutterSecureStorage();

//*
  bool checkPin(String pin) {
    const String sentCode = "9323";
    if (pin == sentCode) {
      return true;
    } else {
      return false;
    }
  }

//*
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

  String createAccount(String code, String number) {
    return number;
  }
}
