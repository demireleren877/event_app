// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginVM on _LoginVMBase, Store {
  late final _$emailAtom = Atom(name: '_LoginVMBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_LoginVMBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$isPasswordVisibleAtom =
      Atom(name: '_LoginVMBase.isPasswordVisible', context: context);

  @override
  bool get isPasswordVisible {
    _$isPasswordVisibleAtom.reportRead();
    return super.isPasswordVisible;
  }

  @override
  set isPasswordVisible(bool value) {
    _$isPasswordVisibleAtom.reportWrite(value, super.isPasswordVisible, () {
      super.isPasswordVisible = value;
    });
  }

  late final _$authenticationAsyncAction =
      AsyncAction('_LoginVMBase.authentication', context: context);

  @override
  Future<dynamic> authentication(dynamic context) {
    return _$authenticationAsyncAction.run(() => super.authentication(context));
  }

  late final _$_LoginVMBaseActionController =
      ActionController(name: '_LoginVMBase', context: context);

  @override
  void onEmailChange(String value) {
    final _$actionInfo = _$_LoginVMBaseActionController.startAction(
        name: '_LoginVMBase.onEmailChange');
    try {
      return super.onEmailChange(value);
    } finally {
      _$_LoginVMBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onPasswordChange(String value) {
    final _$actionInfo = _$_LoginVMBaseActionController.startAction(
        name: '_LoginVMBase.onPasswordChange');
    try {
      return super.onPasswordChange(value);
    } finally {
      _$_LoginVMBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePasswordVisibility() {
    final _$actionInfo = _$_LoginVMBaseActionController.startAction(
        name: '_LoginVMBase.changePasswordVisibility');
    try {
      return super.changePasswordVisibility();
    } finally {
      _$_LoginVMBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
isPasswordVisible: ${isPasswordVisible}
    ''';
  }
}
