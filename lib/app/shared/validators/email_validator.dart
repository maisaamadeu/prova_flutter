class EmailValidator {
  String? validate({String? email}) {
    if (email == null || email.isEmpty) {
      return 'O email é obrigatório';
    }

    if (email.length > 20) {
      return 'O email é muito longo';
    }

    if (email.startsWith(' ')) {
      return 'O email não pode começar com um espaço vazio';
    }

    if (email.endsWith(' ')) {
      return 'O email não pode terminar com um espaço vazio';
    }

    final RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (emailRegExp.hasMatch(email) == false) {
      return 'O email é inválido';
    }

    return null;
  }
}
