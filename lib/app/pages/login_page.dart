import 'package:flutter/material.dart';
import 'package:prova_flutter/app/pages/home_page.dart';
import 'package:prova_flutter/app/shared/enums/app_state.dart';
import 'package:prova_flutter/app/shared/stores/auth_store.dart';
import 'package:prova_flutter/app/shared/validators/password_validator.dart';
import 'package:prova_flutter/app/shared/validators/username_validator.dart';
import 'package:prova_flutter/app/shared/widgets/custom_alert_dialog.dart';
import 'package:prova_flutter/app/shared/widgets/custom_elevated_button.dart';
import 'package:prova_flutter/app/shared/widgets/custom_text_button.dart';
import 'package:prova_flutter/app/shared/widgets/custom_text_form_field.dart';
import 'package:prova_flutter/app/shared/widgets/gradient_container.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prova_flutter/app/utils/open_url.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthStore authStore = AuthStore();

  final formKey = GlobalKey<FormState>();
  final TextEditingController userTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
    userTextEditingController.dispose();
    passwordTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GradientContainer(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Container()),
                CustomTextFormField(
                  border: true,
                  controller: userTextEditingController,
                  labelText: 'Usuário',
                  prefixIcon: const Icon(
                    Icons.person_rounded,
                    color: Colors.black,
                  ),
                  validator: (value) =>
                      UsernameValidator().validate(user: value),
                  onChanged: (value) => authStore.username = value,
                  filled: true,
                  fillColor: Colors.white,
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  border: true,
                  controller: passwordTextEditingController,
                  labelText: 'Senha',
                  prefixIcon: const Icon(
                    Icons.lock_rounded,
                    color: Colors.black,
                  ),
                  obscureText: true,
                  validator: (value) =>
                      PasswordValidator().validate(password: value),
                  onChanged: (value) => authStore.password = value,
                  filled: true,
                  fillColor: Colors.white,
                ),
                const SizedBox(height: 30),
                CustomElevatedButton(
                  borderRadius: 1000,
                  height: 50,
                  width: 200,
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      final result = await authStore.signIn();

                      if (!context.mounted) return;

                      if (result == null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) =>
                              CustomAlertDialog().showCustomAlertDialog(
                            title: 'Credencias Inválidas',
                            icon: const Icon(
                              Icons.close,
                              size: 56,
                              color: Colors.red,
                            ),
                            content:
                                'Verifique as credenciais inseridas e tente novamente',
                            actions: [
                              CustomTextButton(
                                buttonText: 'OKAY',
                                textColor: Colors.red,
                                fontWeight: FontWeight.normal,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        );
                      }
                    }
                  },
                  child: Observer(
                    builder: (context) {
                      if (authStore.appState == AppState.loading) {
                        return const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        );
                      } else {
                        return const Text(
                          'Entrar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            letterSpacing: 1,
                          ),
                        );
                      }
                    },
                  ),
                ),
                Expanded(child: Container()),
                CustomTextButton(
                  buttonText: 'Política de Privacidade',
                  onPressed: () async {
                    await OpenUrl().open(
                        url: 'https://www.google.com.br/', context: context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
