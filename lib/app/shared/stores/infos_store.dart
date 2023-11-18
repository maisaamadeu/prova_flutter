import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'infos_store.g.dart';

class InfosStore = _InfosStore with _$InfosStore;

abstract class _InfosStore with Store {
  late SharedPreferences _preferences;

  _InfosStore() {
    _initSharedPreferences();
  }

  @observable
  List<String> infosList = [];

  @action
  void addInfo(String newInfo) {
    infosList.add(newInfo);
    infosList = List.from(infosList);
    _saveInfosList();
  }

  @action
  void removeInfo(int index) {
    infosList.removeAt(index);
    infosList = List.from(infosList);
    _saveInfosList();
  }

  @action
  void editInfo(String newInfo, int index) {
    infosList[index] = newInfo;
    infosList = List.from(infosList);
    _saveInfosList();
  }

  void _initSharedPreferences() async {
    _preferences = await SharedPreferences.getInstance();
    _loadInfosList();
  }

  void _loadInfosList() {
    infosList = _preferences.getStringList('infosList') ?? [];
  }

  void _saveInfosList() {
    _preferences.setStringList('infosList', infosList);
  }
}
