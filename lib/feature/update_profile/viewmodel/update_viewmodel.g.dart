// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UpdateProfileVM on _UpdateProfileVMBase, Store {
  late final _$imageUrlAtom =
      Atom(name: '_UpdateProfileVMBase.imageUrl', context: context);

  @override
  String? get imageUrl {
    _$imageUrlAtom.reportRead();
    return super.imageUrl;
  }

  @override
  set imageUrl(String? value) {
    _$imageUrlAtom.reportWrite(value, super.imageUrl, () {
      super.imageUrl = value;
    });
  }

  late final _$phoneNumberAtom =
      Atom(name: '_UpdateProfileVMBase.phoneNumber', context: context);

  @override
  String get phoneNumber {
    _$phoneNumberAtom.reportRead();
    return super.phoneNumber;
  }

  @override
  set phoneNumber(String value) {
    _$phoneNumberAtom.reportWrite(value, super.phoneNumber, () {
      super.phoneNumber = value;
    });
  }

  late final _$imageFileAtom =
      Atom(name: '_UpdateProfileVMBase.imageFile', context: context);

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

  late final _$nameAtom =
      Atom(name: '_UpdateProfileVMBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$usernameAtom =
      Atom(name: '_UpdateProfileVMBase.username', context: context);

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  late final _$birthDateAtom =
      Atom(name: '_UpdateProfileVMBase.birthDate', context: context);

  @override
  DateTime? get birthDate {
    _$birthDateAtom.reportRead();
    return super.birthDate;
  }

  @override
  set birthDate(DateTime? value) {
    _$birthDateAtom.reportWrite(value, super.birthDate, () {
      super.birthDate = value;
    });
  }

  late final _$updateProfileAsyncAction =
      AsyncAction('_UpdateProfileVMBase.updateProfile', context: context);

  @override
  Future<dynamic> updateProfile(
      String name, String userName, DateTime birthDate, String phoneNumber) {
    return _$updateProfileAsyncAction
        .run(() => super.updateProfile(name, userName, birthDate, phoneNumber));
  }

  late final _$setProfileImageAsyncAction =
      AsyncAction('_UpdateProfileVMBase.setProfileImage', context: context);

  @override
  Future setProfileImage() {
    return _$setProfileImageAsyncAction.run(() => super.setProfileImage());
  }

  late final _$uploadImageAsyncAction =
      AsyncAction('_UpdateProfileVMBase.uploadImage', context: context);

  @override
  Future uploadImage() {
    return _$uploadImageAsyncAction.run(() => super.uploadImage());
  }

  late final _$_UpdateProfileVMBaseActionController =
      ActionController(name: '_UpdateProfileVMBase', context: context);

  @override
  dynamic onPhoneNumberChanged(String value) {
    final _$actionInfo = _$_UpdateProfileVMBaseActionController.startAction(
        name: '_UpdateProfileVMBase.onPhoneNumberChanged');
    try {
      return super.onPhoneNumberChanged(value);
    } finally {
      _$_UpdateProfileVMBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onDateChanged(DateTime date) {
    final _$actionInfo = _$_UpdateProfileVMBaseActionController.startAction(
        name: '_UpdateProfileVMBase.onDateChanged');
    try {
      return super.onDateChanged(date);
    } finally {
      _$_UpdateProfileVMBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onNameChanged(String value) {
    final _$actionInfo = _$_UpdateProfileVMBaseActionController.startAction(
        name: '_UpdateProfileVMBase.onNameChanged');
    try {
      return super.onNameChanged(value);
    } finally {
      _$_UpdateProfileVMBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onUsernameChanged(String value) {
    final _$actionInfo = _$_UpdateProfileVMBaseActionController.startAction(
        name: '_UpdateProfileVMBase.onUsernameChanged');
    try {
      return super.onUsernameChanged(value);
    } finally {
      _$_UpdateProfileVMBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
imageUrl: ${imageUrl},
phoneNumber: ${phoneNumber},
imageFile: ${imageFile},
name: ${name},
username: ${username},
birthDate: ${birthDate}
    ''';
  }
}
