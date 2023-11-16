class UserValidator {
  String? validate({String? user}) {
    if (user == null || user.isEmpty) {
      return 'O usuário é obrigatório';
    }

    if (user.length > 20) {
      return 'O usuário é muito longo';
    }

    if (user.startsWith(' ')) {
      return 'O usuário não pode começar com um espaço vazio';
    }

    if (user.endsWith(' ')) {
      return 'O usuário não pode terminar com um espaço vazio';
    }

    return null;
  }
}
