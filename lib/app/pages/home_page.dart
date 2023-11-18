import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prova_flutter/app/shared/stores/infos_store.dart';
import 'package:prova_flutter/app/shared/widgets/custom_text_button.dart';
import 'package:prova_flutter/app/shared/widgets/custom_text_form_field.dart';
import 'package:prova_flutter/app/shared/widgets/gradient_container.dart';
import 'package:prova_flutter/app/utils/open_url.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final InfosStore infosStore = InfosStore();
  final todoKey = GlobalKey<FormState>();
  final TextEditingController infoTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GradientContainer(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: todoKey,
            child: Observer(
              builder: (context) => Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) => Container(),
                      itemCount: infosStore.infosList.length,
                      separatorBuilder: (context, index) => Divider(),
                    ),
                  ),
                  CustomTextFormField(
                    controller: infoTextEditingController,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Digite seu texo',
                    textAlign: TextAlign.center,
                    onChanged: (value) => infosStore.newInfo = value,
                    suffixIcon: infosStore.newInfo.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              infoTextEditingController.clear();
                              infosStore.newInfo = '';
                            },
                            icon: const Icon(
                              Icons.add,
                              size: 24,
                            ),
                          )
                        : null,
                    onFieldSubmitted: (value) {
                      infoTextEditingController.clear();
                      infosStore.newInfo = '';
                    },
                  ),
                  CustomTextButton(
                    buttonText: 'Política de Privacidade',
                    onPressed: () async {
                      await OpenUrl().open(
                        url: 'https://www.google.com.br/',
                        context: context,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
