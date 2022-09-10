// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainVM on _MainVMBase, Store {
  late final _$searchValueAtom =
      Atom(name: '_MainVMBase.searchValue', context: context);

  @override
  String get searchValue {
    _$searchValueAtom.reportRead();
    return super.searchValue;
  }

  @override
  set searchValue(String value) {
    _$searchValueAtom.reportWrite(value, super.searchValue, () {
      super.searchValue = value;
    });
  }

  late final _$_MainVMBaseActionController =
      ActionController(name: '_MainVMBase', context: context);

  @override
  dynamic chageSearchValue(String value) {
    final _$actionInfo = _$_MainVMBaseActionController.startAction(
        name: '_MainVMBase.chageSearchValue');
    try {
      return super.chageSearchValue(value);
    } finally {
      _$_MainVMBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchValue: ${searchValue}
    ''';
  }
}
