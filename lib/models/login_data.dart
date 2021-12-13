class LoginData {
  String? phoneNumber;
  String? code;
  String? verificationCode;

  LoginData({
    this.phoneNumber,
    this.code,
    this.verificationCode,
  });

  bool isValid() {
    return phoneNumber != null && code != null;
  }
}
