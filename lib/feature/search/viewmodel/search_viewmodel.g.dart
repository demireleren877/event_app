// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchVM on _SearchVMBase, Store {
  late final _$searchValueAtom =
      Atom(name: '_SearchVMBase.searchValue', context: context);

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

  late final _$_SearchVMBaseActionController =
      ActionController(name: '_SearchVMBase', context: context);

  @override
  dynamic changeSearchValue(String value) {
    final _$actionInfo = _$_SearchVMBaseActionController.startAction(
        name: '_SearchVMBase.changeSearchValue');
    try {
      return super.changeSearchValue(value);
    } finally {
      _$_SearchVMBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchValue: ${searchValue}
    ''';
  }
}
