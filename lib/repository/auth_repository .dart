// ignore_for_file: file_names, import_of_legacy_library_into_null_safe, unnecessary_new, prefer_const_constructors, unnecessary_null_comparison, avoid_print

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:test_task_with_auto_route/models/login_data.dart';

class AuthRepository {
  // singleton
  AuthRepository({required LoginData loginData}) : this._loginData = loginData;

  LoginData _loginData;
  LoginData get details => _loginData;

  // final FlutterSecureStorage storage = new FlutterSecureStorage();

  static Future<AuthRepository> init(FlutterSecureStorage storage) async {
    // final FlutterSecureStorage storage = new FlutterSecureStorage();
    final phone = await storage.read(key: 'phone_number');
    final code = await storage.read(key: 'code');
    final verificationCode = await storage.read(key: 'verification_code');
    final data = LoginData(
        phoneNumber: phone, code: code, verificationCode: verificationCode);
    print(data.code);
    return AuthRepository(loginData: data);
  }

  bool checkPin(String pin) {
    const String sentCode = "9323";
    if (pin == sentCode) {
      _loginData.verificationCode = pin;
      return true;
    } else {
      return false;
    }
  }

  void savePhoneNumber(String phoneNumber) {
    _loginData.phoneNumber = phoneNumber;
  }

  Future<void> logOut() async {
    final FlutterSecureStorage storage = new FlutterSecureStorage();
    storage.delete(key: 'phone_number');
    storage.delete(key: 'code');
    storage.delete(key: 'verification_code');
    storage.deleteAll();
  }

  Future<bool> isRegistered() async {
    final FlutterSecureStorage storage = new FlutterSecureStorage();
    var value = await storage.read(key: 'code');
    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> saveCode(String code) async {
    final FlutterSecureStorage storage = new FlutterSecureStorage();
    _loginData.code = code;
    await _persistDataToDb(storage);
  }

  Future<void> _persistDataToDb(FlutterSecureStorage storage) async {
    // persist to db
    await storage.write(key: 'phone_number', value: _loginData.phoneNumber!);
    await storage.write(key: 'code', value: _loginData.code!);
    await storage.write(
        key: 'verification_code', value: _loginData.verificationCode!);
  }

  Future<LoginData> getUserData(FlutterSecureStorage storage) async {
    final phone = await storage.read(key: 'phone_number');
    final code = await storage.read(key: 'code');
    final verificationCode = await storage.read(key: 'verification_code');
    final data = LoginData(
        phoneNumber: phone, code: code, verificationCode: verificationCode);
    return data;
  }
}
