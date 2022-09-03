import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/routes/route_constants.dart';
import '../../../core/services/firebase_services.dart';
part 'sign_up_viewmodel.g.dart';

class SignUpVM = _SignUpVMBase with _$SignUpVM;

abstract class _SignUpVMBase with Store {
  @observable
  PageController pageController = PageController();

  @observable
  String userName = "";

  @observable
  String email = "";

  @observable
  String password = "";

  @observable
  String image = "";

  @action
  void changeUserName(String value) => userName = value;

  @action
  void changeEmail(String value) => email = value;

  @action
  void changePassword(String value) => password = value;

  @action
  void next() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  @action
  Future createAccount(name, email, password, context, imageUrl) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Navigator.pushNamed(context, Routes.home);
      });
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(
          msg: error.message ?? "Hatalı Giriş Denemesi",
          gravity: ToastGravity.CENTER,
          textColor: AppColors.red);
    }
    await FirebaseServices.user.doc(email).set({
      "name": name,
      "profileImageUrl": imageUrl,
      "email": email,
      "status": "unavailable",
    });
  }
}
