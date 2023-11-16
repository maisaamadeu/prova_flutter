import 'package:flutter/material.dart';
import 'package:prova_flutter/app/shared/stores/auth_store.dart';
import 'package:prova_flutter/app/shared/validators/password_validator.dart';
import 'package:prova_flutter/app/shared/validators/user_validator.dart';
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
            key: authStore.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Container()),
                CustomTextFormField(
                  controller: userTextEditingController,
                  labelText: 'Usuário',
                  iconData: Icons.person_rounded,
                  validator: (value) => UserValidator().validate(user: value),
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  controller: passwordTextEditingController,
                  labelText: 'Senha',
                  iconData: Icons.lock_rounded,
                  obscureText: true,
                  validator: (value) =>
                      PasswordValidator().validate(password: value),
                ),
                const SizedBox(height: 30),
                CustomElevatedButton(
                  borderRadius: 1000,
                  height: 50,
                  width: 200,
                  onPressed: () {
                    authStore.login(context);
                  },
                  child: Observer(
                    builder: (context) {
                      if (authStore.isLoading) {
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
