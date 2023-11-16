import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:prova_flutter/app/pages/home_page.dart';
part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  final formKey = GlobalKey<FormState>();

  @observable
  bool isLoading = false;

  @action
  Future<void> login(BuildContext context) async {
    isLoading = true;
    if (formKey.currentState!.validate()) {
      await Future.delayed(const Duration(seconds: 2));

      if (context.mounted) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
        isLoading = false;
      }
    }
    isLoading = false;
  }
}
