import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prova_flutter/app/shared/stores/infos_store.dart';
import 'package:prova_flutter/app/shared/widgets/custom_alert_dialog.dart';
import 'package:prova_flutter/app/shared/widgets/custom_icon_button.dart';
import 'package:prova_flutter/app/shared/widgets/custom_text_button.dart';
import 'package:prova_flutter/app/shared/widgets/custom_text_form_field.dart';
import 'package:prova_flutter/app/shared/widgets/gradient_container.dart';
import 'package:prova_flutter/app/utils/open_url.dart';

class HomePage extends StatelessWidget {
  final InfosStore infosStore = InfosStore();
  final editInfoKey = GlobalKey<FormState>();
  final TextEditingController infoTextEditingController =
      TextEditingController();

  final TextEditingController editInfoTextEditingController =
      TextEditingController();

  HomePage({super.key});

  void addInfo() {
    if (infoTextEditingController.text.isNotEmpty) {
      infosStore.addInfo(infoTextEditingController.text);
      infoTextEditingController.clear();
    }
  }

  Widget buildInfoItem(BuildContext context, int index) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Observer(builder: (context) {
            return Text(
              infosStore.infosList[index],
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            );
          }),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Row(
            children: [
              CustomIconButton(
                iconData: Icons.edit,
                iconSize: 36,
                onPressed: () => showEditDialog(context, index),
              ),
              CustomIconButton(
                iconData: Icons.cancel,
                iconSize: 36,
                iconColor: Colors.red,
                onPressed: () => showDeleteDialog(context, index),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void showDeleteDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) => CustomAlertDialog().showCustomAlertDialog(
        title: 'Você tem certeza que deseja excluir essa informação?',
        icon: const Icon(
          Icons.question_mark_rounded,
          size: 56,
          color: Colors.red,
        ),
        actions: [
          CustomTextButton(
            buttonText: 'CANCELAR',
            textColor: Colors.green,
            fontWeight: FontWeight.bold,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          CustomTextButton(
            buttonText: 'SIM',
            textColor: Colors.red,
            fontWeight: FontWeight.bold,
            onPressed: () {
              infosStore.removeInfo(index);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  void showEditDialog(BuildContext context, int index) {
    editInfoTextEditingController.text = infosStore.infosList[index];

    showDialog(
      context: context,
      builder: (context) => CustomAlertDialog().showCustomAlertDialog(
        title: 'Alterar Informação',
        icon: const Icon(
          Icons.edit,
          size: 56,
          color: Colors.black,
        ),
        contentWidget: Form(
          key: editInfoKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextFormField(
                controller: editInfoTextEditingController,
                border: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Este campo não pode estar vazio!';
                  }

                  return null;
                },
              ),
            ],
          ),
        ),
        actions: [
          CustomTextButton(
            buttonText: 'CANCELAR',
            textColor: Colors.green,
            fontWeight: FontWeight.bold,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          CustomTextButton(
            buttonText: 'ALTERAR',
            textColor: Colors.red,
            fontWeight: FontWeight.bold,
            onPressed: () {
              if (editInfoKey.currentState!.validate()) {
                infosStore.editInfo(editInfoTextEditingController.text, index);
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GradientContainer(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Observer(
                    builder: (context) => ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>
                          buildInfoItem(context, index),
                      itemCount: infosStore.infosList.length,
                      separatorBuilder: (context, index) => const Divider(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Observer(builder: (context) {
                return CustomTextFormField(
                  border: true,
                  controller: infoTextEditingController,
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Digite seu texto',
                  hintStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  onFieldSubmitted: (value) {
                    addInfo();
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Este campo é obrigatório';
                    }
                    return null;
                  },
                );
              }),
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
    );
  }
}
