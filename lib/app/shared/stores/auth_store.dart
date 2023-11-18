import 'package:mobx/mobx.dart';
import 'package:prova_flutter/app/shared/enums/app_state.dart';
import 'package:prova_flutter/app/shared/services/auth_service.dart';
part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  @observable
  AppState appState = AppState.idle;

  String username = '';
  String password = '';

  @action
  Future<String?> signIn() async {
    appState = AppState.loading;

    final result = await AuthService().signIn(
      username: username,
      password: password,
    );

    appState = AppState.loaded;

    return result;
  }
}
