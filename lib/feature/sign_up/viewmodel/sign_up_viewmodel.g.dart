// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignUpVM on _SignUpVMBase, Store {
  late final _$pageControllerAtom =
      Atom(name: '_SignUpVMBase.pageController', context: context);

  @override
  PageController get pageController {
    _$pageControllerAtom.reportRead();
    return super.pageController;
  }

  @override
  set pageController(PageController value) {
    _$pageControllerAtom.reportWrite(value, super.pageController, () {
      super.pageController = value;
    });
  }

  late final _$userNameAtom =
      Atom(name: '_SignUpVMBase.userName', context: context);

  @override
  String get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(String value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
    });
  }

  late final _$emailAtom = Atom(name: '_SignUpVMBase.email', context: context);

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
      Atom(name: '_SignUpVMBase.password', context: context);

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

  late final _$imageAtom = Atom(name: '_SignUpVMBase.image', context: context);

  @override
  String get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(String value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  late final _$createAccountAsyncAction =
      AsyncAction('_SignUpVMBase.createAccount', context: context);

  @override
  Future<dynamic> createAccount(dynamic name, dynamic email, dynamic password,
      dynamic context, dynamic imageUrl) {
    return _$createAccountAsyncAction.run(
        () => super.createAccount(name, email, password, context, imageUrl));
  }

  late final _$_SignUpVMBaseActionController =
      ActionController(name: '_SignUpVMBase', context: context);

  @override
  void changeUserName(String value) {
    final _$actionInfo = _$_SignUpVMBaseActionController.startAction(
        name: '_SignUpVMBase.changeUserName');
    try {
      return super.changeUserName(value);
    } finally {
      _$_SignUpVMBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeEmail(String value) {
    final _$actionInfo = _$_SignUpVMBaseActionController.startAction(
        name: '_SignUpVMBase.changeEmail');
    try {
      return super.changeEmail(value);
    } finally {
      _$_SignUpVMBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePassword(String value) {
    final _$actionInfo = _$_SignUpVMBaseActionController.startAction(
        name: '_SignUpVMBase.changePassword');
    try {
      return super.changePassword(value);
    } finally {
      _$_SignUpVMBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void next() {
    final _$actionInfo =
        _$_SignUpVMBaseActionController.startAction(name: '_SignUpVMBase.next');
    try {
      return super.next();
    } finally {
      _$_SignUpVMBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pageController: ${pageController},
userName: ${userName},
email: ${email},
password: ${password},
image: ${image}
    ''';
  }
}
