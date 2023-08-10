import 'package:event_app/feature/sign_up/components/signup_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';

import '../../../core/routes/route_constants.dart';
import '../viewmodel/sign_up_viewmodel.dart';
import 'add_later.dart';
import 'profile_image.dart';

class PageFour extends StatelessWidget {
  const PageFour({
    Key? key,
    required this.signUpViewmodel,
  }) : super(key: key);

  final SignUpVM signUpViewmodel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Profil fotoğrafı ekle",
              style: context.textTheme.headlineMedium,
            ),
            context.emptySizedHeightBoxNormal,
            ProfileImage(signUpViewmodel: signUpViewmodel),
            context.emptySizedHeightBoxNormal,
            Observer(
              builder: (_) {
                return SignUpButton(
                  buttonColor: const Color(0xFFACA0DF),
                  textColor: Colors.black,
                  text: signUpViewmodel.imageFile == null
                      ? "Bir Fotoğraf Ekle"
                      : "Kaydını Tamamla",
                  onPressed: () {
                    signUpViewmodel.imageFile == null
                        ? signUpViewmodel.setProfileImage()
                        : signUpViewmodel.createAccount(context).then(
                              (value) =>
                                  Navigator.pushNamed(context, Routes.home),
                            );
                  },
                );
              },
            ),
            context.emptySizedHeightBoxLow3x,
            AddLater(signUpViewmodel: signUpViewmodel),
          ],
        ),
      ),
    );
  }
}
