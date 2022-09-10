import 'package:mobx/mobx.dart';
part 'main_viewmodel.g.dart';

class MainVM = _MainVMBase with _$MainVM;

abstract class _MainVMBase with Store {
  @observable
  String searchValue = "";

  @action
  chageSearchValue(String value) {
    searchValue = value;
  }
}
