import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';

import '../../../core/services/firebase_services.dart';
part 'update_viewmodel.g.dart';

class UpdateProfileVM = _UpdateProfileVMBase with _$UpdateProfileVM;

abstract class _UpdateProfileVMBase with Store {
  @observable
  String? imageUrl = "";

  @observable
  File? imageFile;

  @observable
  String name = "";

  @observable
  String username = "";

  @observable
  DateTime? birthDate;

  @action
  onDateChanged(DateTime date) => birthDate = date;

  @action
  onNameChanged(String value) => name = value;

  @action
  onUsernameChanged(String value) => username = value;

  @action
  Future updateProfile(String name, String userName, DateTime birthDate) async {
    await FirebaseServices.user
        .doc(FirebaseServices.auth.currentUser!.email)
        .update({
      "name": name,
      "birthDate": birthDate,
      "userName": userName,
      "profileImageUrl": imageUrl == ""
          ? await FirebaseServices.user
              .doc(FirebaseServices.auth.currentUser!.email)
              .get()
              .then((value) {
              return value["profileImageUrl"];
            })
          : imageUrl,
    });
  }

  @action
  setProfileImage() async {
    ImagePicker _picker = ImagePicker();
    await _picker.pickImage(source: ImageSource.camera).then((xFile) => {
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
}
