import 'package:mobx/mobx.dart';
part 'search_viewmodel.g.dart';

class SearchVM = _SearchVMBase with _$SearchVM;

abstract class _SearchVMBase with Store {
  @observable
  String searchValue = "";

  @action
  changeSearchValue(String value) {
    searchValue = value;
  }
}
