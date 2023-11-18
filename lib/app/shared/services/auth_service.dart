class AuthService {
  Future<String?> signIn({String? username, String? password}) async {
    await Future.delayed(const Duration(seconds: 2));
    return null;
  }
}
