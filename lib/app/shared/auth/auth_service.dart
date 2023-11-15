import 'package:prova_flutter/app/shared/validators/email_validator.dart';
import 'package:prova_flutter/app/shared/validators/password_validator.dart';

class AuthService {
  Future<String?> login({String? email, String? password}) async {
    // Simulating a connection to the API
    await Future.delayed(const Duration(seconds: 2));

    final emailError = EmailValidator().validate(email: email);
    final passwordError = PasswordValidator().validate(password: password);

    return emailError ?? passwordError;
  }
}
