// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeVM on _HomeVMBase, Store {
  late final _$selectedIndexAtom =
      Atom(name: '_HomeVMBase.selectedIndex', context: context);

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  late final _$_HomeVMBaseActionController =
      ActionController(name: '_HomeVMBase', context: context);

  @override
  void onTabChange(int index) {
    final _$actionInfo = _$_HomeVMBaseActionController.startAction(
        name: '_HomeVMBase.onTabChange');
    try {
      return super.onTabChange(index);
    } finally {
      _$_HomeVMBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedIndex: ${selectedIndex}
    ''';
  }
}
