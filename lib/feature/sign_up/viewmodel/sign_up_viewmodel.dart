import 'dart:io';

import 'package:event_app/core/cache/cache_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/routes/route_constants.dart';
import '../../../core/services/firebase_services.dart';
part 'sign_up_viewmodel.g.dart';

class SignUpVM = _SignUpVMBase with _$SignUpVM;

abstract class _SignUpVMBase with Store {
  final CacheManager _cacheManager = CacheManager();

  @observable
  bool isUserExist = false;

  @observable
  PageController pageController = PageController();

  @observable
  String userName = "";

  @observable
  String email = "";

  @observable
  String password = "";

  @observable
  String imageUrl = "";

  @observable
  String name = "";

  @observable
  File? imageFile;

  @action
  void changeUserName(String value) => userName = value;

  @action
  void changeEmail(String value) => email = value;

  @action
  void changePassword(String value) => password = value;

  @action
  void changeName(String value) {
    name = value;
  }

  @action
  void next() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  @action
  Future createAccount(context) async {
    if (name != "" && userName != "" && email != "" && password != "") {
      FirebaseServices.user
          .where("userName", isEqualTo: userName)
          .get()
          .then((value) async {
        if (value.docs.isEmpty) {
          try {
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: email, password: password);
            addUsertoHive();
            await FirebaseServices.user.doc(email).set({
              "name": name,
              "userName": userName,
              "phoneNumber": "",
              "takenTickets": [],
              "followRequests": [],
              "followers": [],
              "following": [],
              "birthDate": DateTime.now(),
              "profileImageUrl": imageUrl,
              "email": email,
              "status": "unavailable",
            }).then(
              (value) => Navigator.pushNamed(context, Routes.home),
            );
          } on FirebaseAuthException catch (error) {
            Fluttertoast.showToast(
                msg: error.message ?? "Hatalı Giriş Denemesi",
                gravity: ToastGravity.CENTER,
                textColor: AppColors.red);
          }
        } else {
          Fluttertoast.showToast(msg: "Bu Kullanıcı Adı Alınamaz.");
        }
      });
    } else {
      Fluttertoast.showToast(msg: "Boş Alan Bırakmayınız.");
    }
  }

  @action
  setProfileImage() async {
    ImagePicker picker = ImagePicker();
    await picker.pickImage(source: ImageSource.camera).then((xFile) => {
          if (xFile != null)
            {
              imageFile = File(xFile.path),
              uploadImage(),
            }
        });
  }

  @action
  uploadImage() async {
    String fileName = const Uuid().v1();
    var ref = FirebaseStorage.instance
        .ref()
        .child("profileImages")
        .child("$fileName.jpg");
    var uploadTask = await ref.putFile(imageFile!).catchError((error) async {});
    imageUrl = await uploadTask.ref.getDownloadURL();
  }

  @action
  void addUsertoHive() {
    _cacheManager.saveUser(userName);
  }
}
