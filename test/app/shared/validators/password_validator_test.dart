import 'package:flutter_test/flutter_test.dart';
import 'package:prova_flutter/app/shared/validators/password_validator.dart';

void main() {
  late PasswordValidator passwordValidator;

  setUp(() {
    passwordValidator = PasswordValidator();
  });

  group(
    'password validation',
    () {
      test('should return an error message if the password is null', () {
        final result = passwordValidator.validate();

        expect(result, 'A senha é obrigatória');
      });

      test('should return an error message if the password is empty', () {
        final result = passwordValidator.validate();

        expect(result, 'A senha é obrigatória');
      });

      test(
          'should return an error message If the password length is less than 2 characters',
          () {
        final result = passwordValidator.validate(password: 'e');

        expect(result, 'A senha é muito curta');
      });

      test(
          'should return an error message If the password length is greater than 20 characters',
          () {
        final result = passwordValidator.validate(
            password: 'email_extremamente_longo_sério_ que_longo');

        expect(result, 'A senha é muito longa');
      });

      test('should return an error message If the password starts with a space',
          () {
        final result = passwordValidator.validate(password: ' email');

        expect(result, 'A senha não pode começar com um espaço vazio');
      });

      test('should return an error message If the password ends with a space',
          () {
        final result = passwordValidator.validate(password: 'email ');

        expect(result, 'A senha não pode terminar com um espaço vazio');
      });

      test(
          'should return an error message If the password contains special characters',
          () {
        final result = passwordValidator.validate(password: 'email@');

        expect(result, 'A senha não pode conter caracteres especiais');
      });

      test('should return a null if the password is valid', () {
        final result = passwordValidator.validate(password: 'senha123');

        expect(result, isNull);
      });
    },
  );
}
