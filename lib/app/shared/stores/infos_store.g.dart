// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'infos_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InfosStore on _InfosStore, Store {
  late final _$infosListAtom =
      Atom(name: '_InfosStore.infosList', context: context);

  @override
  List<String> get infosList {
    _$infosListAtom.reportRead();
    return super.infosList;
  }

  @override
  set infosList(List<String> value) {
    _$infosListAtom.reportWrite(value, super.infosList, () {
      super.infosList = value;
    });
  }

  late final _$_InfosStoreActionController =
      ActionController(name: '_InfosStore', context: context);

  @override
  void addInfo(String newInfo) {
    final _$actionInfo =
        _$_InfosStoreActionController.startAction(name: '_InfosStore.addInfo');
    try {
      return super.addInfo(newInfo);
    } finally {
      _$_InfosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeInfo(int index) {
    final _$actionInfo = _$_InfosStoreActionController.startAction(
        name: '_InfosStore.removeInfo');
    try {
      return super.removeInfo(index);
    } finally {
      _$_InfosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editInfo(String newInfo, int index) {
    final _$actionInfo =
        _$_InfosStoreActionController.startAction(name: '_InfosStore.editInfo');
    try {
      return super.editInfo(newInfo, index);
    } finally {
      _$_InfosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
infosList: ${infosList}
    ''';
  }
}
