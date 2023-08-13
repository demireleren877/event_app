import 'package:event_app/core/services/firebase_services.dart';
import 'package:mobx/mobx.dart';
part 'main_viewmodel.g.dart';

class MainVM = _MainVMBase with _$MainVM;

abstract class _MainVMBase with Store {
  @observable
  String searchValue = "";

  @observable
  String username = "";

  @action
  setUserName() {
    FirebaseServices.user
        .doc(FirebaseServices.auth.currentUser!.email)
        .get()
        .then((value) => username = value.data()!["name"]);
  }

  @action
  chageSearchValue(String value) {
    searchValue = value;
  }
}
