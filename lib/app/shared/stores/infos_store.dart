import 'package:mobx/mobx.dart';
import 'package:prova_flutter/app/shared/enums/app_state.dart';
part 'infos_store.g.dart';

// ATÉ PENSEI EM CRIAR UM MODEL PARA A INFORMAÇÃO, MAS JÁ QUE ELA É APENAS UMA STRING AO MEU VER NÃO VALIA A PENA :)

class InfosStore = _InfosStore with _$InfosStore;

abstract class _InfosStore with Store {
  @observable
  AppState appState = AppState.idle;

  @observable
  String newInfo = '';

  @observable
  List<String> infosList = [];

  @action
  void addInfo() {
    infosList.add(newInfo);
  }

  @action
  void removeInfo(int index) {
    infosList.removeAt(index);
  }
}
