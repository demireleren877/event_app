import 'package:mobx/mobx.dart';
part 'sb_profile_viewmodel.g.dart';

class SBSProfileVM = _SBSProfileVMBase with _$SBSProfileVM;

abstract class _SBSProfileVMBase with Store {
  @observable
  int followersCount = 0;

  @observable
  int followingCount = 0;

  @action
  void setFollowersCount(int count) {
    followersCount = count;
  }

  @action
  void setFollowingCount(int count) {
    followingCount = count;
  }
}
