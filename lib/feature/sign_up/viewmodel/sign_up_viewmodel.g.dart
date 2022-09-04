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

  late final _$imageUrlAtom =
      Atom(name: '_SignUpVMBase.imageUrl', context: context);

  @override
  String get imageUrl {
    _$imageUrlAtom.reportRead();
    return super.imageUrl;
  }

  @override
  set imageUrl(String value) {
    _$imageUrlAtom.reportWrite(value, super.imageUrl, () {
      super.imageUrl = value;
    });
  }

  late final _$imageFileAtom =
      Atom(name: '_SignUpVMBase.imageFile', context: context);

  @override
  File? get imageFile {
    _$imageFileAtom.reportRead();
    return super.imageFile;
  }

  @override
  set imageFile(File? value) {
    _$imageFileAtom.reportWrite(value, super.imageFile, () {
      super.imageFile = value;
    });
  }

  late final _$createAccountAsyncAction =
      AsyncAction('_SignUpVMBase.createAccount', context: context);

  @override
  Future<dynamic> createAccount(dynamic context) {
    return _$createAccountAsyncAction.run(() => super.createAccount(context));
  }

  late final _$setProfileImageAsyncAction =
      AsyncAction('_SignUpVMBase.setProfileImage', context: context);

  @override
  Future setProfileImage() {
    return _$setProfileImageAsyncAction.run(() => super.setProfileImage());
  }

  late final _$uploadImageAsyncAction =
      AsyncAction('_SignUpVMBase.uploadImage', context: context);

  @override
  Future uploadImage() {
    return _$uploadImageAsyncAction.run(() => super.uploadImage());
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
  void addUsertoHive() {
    final _$actionInfo = _$_SignUpVMBaseActionController.startAction(
        name: '_SignUpVMBase.addUsertoHive');
    try {
      return super.addUsertoHive();
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
imageUrl: ${imageUrl},
imageFile: ${imageFile}
    ''';
  }
}
