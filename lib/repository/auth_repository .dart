// ignore_for_file: file_names, import_of_legacy_library_into_null_safe, unnecessary_new, prefer_const_constructors, unnecessary_null_comparison, avoid_print

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:test_task_with_auto_route/models/login_data.dart';

class AuthRepository {
  // singleton
  AuthRepository({required LoginData loginData}) : this._loginData = loginData;

  LoginData _loginData;
  LoginData get details => _loginData;

  static final FlutterSecureStorage storage = new FlutterSecureStorage();

  static Future<AuthRepository> init() async {
    final phone = await storage.read(key: 'phone_number');
    final code = await storage.read(key: 'code');
    final verificationCode = await storage.read(key: 'verification_code');
    final data = LoginData(
        phoneNumber: phone, code: code, verificationCode: verificationCode);
    return AuthRepository(loginData: data);
  }

//*
  bool checkPin(String pin) {
    const String sentCode = "9323";
    if (pin == sentCode) {
      _loginData.verificationCode = pin;
      return true;
    } else {
      return false;
    }
  }

//*
  void savePhoneNumber(String phoneNumber) {
    _loginData.phoneNumber = phoneNumber;
  }

  Future<void> saveCode(String code) async {
    _loginData.code = code;
    await _persistDataToDb();
  }

  Future<void> _persistDataToDb() async {
    // persist to db
    await storage.write(key: 'phone_number', value: _loginData.phoneNumber!);
    await storage.write(key: 'code', value: _loginData.code!);
    await storage.write(
        key: 'verification_code', value: _loginData.verificationCode!);
  }
}
