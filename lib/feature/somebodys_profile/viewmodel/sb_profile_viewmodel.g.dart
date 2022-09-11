// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sb_profile_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SBSProfileVM on _SBSProfileVMBase, Store {
  late final _$followersCountAtom =
      Atom(name: '_SBSProfileVMBase.followersCount', context: context);

  @override
  int get followersCount {
    _$followersCountAtom.reportRead();
    return super.followersCount;
  }

  @override
  set followersCount(int value) {
    _$followersCountAtom.reportWrite(value, super.followersCount, () {
      super.followersCount = value;
    });
  }

  late final _$followingCountAtom =
      Atom(name: '_SBSProfileVMBase.followingCount', context: context);

  @override
  int get followingCount {
    _$followingCountAtom.reportRead();
    return super.followingCount;
  }

  @override
  set followingCount(int value) {
    _$followingCountAtom.reportWrite(value, super.followingCount, () {
      super.followingCount = value;
    });
  }

  late final _$_SBSProfileVMBaseActionController =
      ActionController(name: '_SBSProfileVMBase', context: context);

  @override
  void setFollowersCount(int count) {
    final _$actionInfo = _$_SBSProfileVMBaseActionController.startAction(
        name: '_SBSProfileVMBase.setFollowersCount');
    try {
      return super.setFollowersCount(count);
    } finally {
      _$_SBSProfileVMBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFollowingCount(int count) {
    final _$actionInfo = _$_SBSProfileVMBaseActionController.startAction(
        name: '_SBSProfileVMBase.setFollowingCount');
    try {
      return super.setFollowingCount(count);
    } finally {
      _$_SBSProfileVMBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
followersCount: ${followersCount},
followingCount: ${followingCount}
    ''';
  }
}
