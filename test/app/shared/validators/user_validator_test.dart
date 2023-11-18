import 'package:flutter_test/flutter_test.dart';
import 'package:prova_flutter/app/shared/validators/username_validator.dart';

void main() {
  late UsernameValidator usernameValidator;

  setUp(() {
    usernameValidator = UsernameValidator();
  });

  group('user validation', () {
    test('should return an error message if the user is null', () {
      final result = usernameValidator.validate();

      expect(result, 'O usuário é obrigatório');
    });

    test('should return an error message if the user is empty', () {
      final result = usernameValidator.validate(user: '');

      expect(result, 'O usuário é obrigatório');
    });

    test(
        'should return an error message If the user length is greater than 20 characters',
        () {
      final result = usernameValidator.validate(
          user: 'email_extremamente_longo_sério_ que_longo');

      expect(result, 'O usuário é muito longo');
    });

    test('should return an error message If the user starts with a space', () {
      final result = usernameValidator.validate(user: ' email');

      expect(result, 'O usuário não pode começar com um espaço vazio');
    });

    test('should return an error message If the user ends with a space', () {
      final result = usernameValidator.validate(user: 'email ');

      expect(result, 'O usuário não pode terminar com um espaço vazio');
    });

    test('should return a null if the email is valid', () {
      final result = usernameValidator.validate(user: 'email@email.com');

      expect(result, isNull);
    });
  });
}
