import 'package:flutter_test/flutter_test.dart';
import 'package:prova_flutter/app/shared/auth/auth_service.dart';

void main() {
  late AuthService authService;

  setUp(() {
    authService = AuthService();
  });

  group('login validation', () {
    test(
        'should return an error message if the email or the password is invalid',
        () async {
      final result = await authService.login(email: 'maisa', password: '_');

      expect(result, isA<String>());
    });

    test('should return a null if the email and the password is valid',
        () async {
      final result = await authService.login(
          email: 'maisa@email.com', password: 'maisa123');

      expect(result, isNull);
    });
  });
}
