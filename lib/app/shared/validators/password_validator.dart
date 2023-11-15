class PasswordValidator {
  String? validate({String? password}) {
    if (password == null || password.isEmpty) {
      return 'A senha é obrigatória';
    }

    if (password.length < 2) {
      return 'A senha é muito curta';
    }

    if (password.length > 20) {
      return 'A senha é muito longa';
    }

    if (password.startsWith(' ')) {
      return 'A senha não pode começar com um espaço vazio';
    }

    if (password.endsWith(' ')) {
      return 'A senha não pode terminar com um espaço vazio';
    }

    final RegExp passwordRegExp = RegExp(r"^[a-zA-Z0-9]*$");

    if (passwordRegExp.hasMatch(password) == false) {
      return 'A senha não pode conter caracteres especiais';
    }

    return null;
  }
}
