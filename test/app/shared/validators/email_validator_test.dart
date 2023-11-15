import 'package:flutter_test/flutter_test.dart';
import 'package:prova_flutter/app/shared/validators/email_validator.dart';

void main() {
  late EmailValidator emailValidator;

  setUp(() {
    emailValidator = EmailValidator();
  });

  group('email validation', () {
    test('should return an error message if the email is null', () {
      final result = emailValidator.validate();

      expect(result, 'O email é obrigatório');
    });

    test('should return an error message if the email is empty', () {
      final result = emailValidator.validate(email: '');

      expect(result, 'O email é obrigatório');
    });

    test(
        'should return an error message If the email length is greater than 20 characters',
        () {
      final result = emailValidator.validate(
          email: 'email_extremamente_longo_sério_ que_longo');

      expect(result, 'O email é muito longo');
    });

    test('should return an error message If the email starts with a space', () {
      final result = emailValidator.validate(email: ' email');

      expect(result, 'O email não pode começar com um espaço vazio');
    });

    test('should return an error message If the email ends with a space', () {
      final result = emailValidator.validate(email: 'email ');

      expect(result, 'O email não pode terminar com um espaço vazio');
    });

    test('should return an error message If the email is invalid', () {
      final result = emailValidator.validate(email: 'email.com');

      expect(result, 'O email é inválido');
    });

    test('should return a null if the email is valid', () {
      final result = emailValidator.validate(email: 'email@email.com');

      expect(result, isNull);
    });
  });
}
