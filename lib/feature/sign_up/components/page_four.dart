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
    required SignUpVM signUpViewmodel,
  })  : _signUpViewmodel = signUpViewmodel,
        super(key: key);

  final SignUpVM _signUpViewmodel;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Profil fotoğrafı ekle",
            style: context.textTheme.headline4,
          ),
          context.emptySizedHeightBoxNormal,
          ProfileImage(signUpViewmodel: _signUpViewmodel),
          context.emptySizedHeightBoxNormal,
          Observer(
            builder: (_) {
              return SignUpButton(
                buttonColor: const Color(0xFFACA0DF),
                textColor: Colors.black,
                text: _signUpViewmodel.imageFile == null
                    ? "Bir Fotoğraf Ekle"
                    : "Kaydını Tamamla",
                onPressed: () {
                  _signUpViewmodel.imageFile == null
                      ? _signUpViewmodel.setProfileImage()
                      : _signUpViewmodel.createAccount(context).then(
                            (value) =>
                                Navigator.pushNamed(context, Routes.home),
                          );
                },
              );
            },
          ),
          context.emptySizedHeightBoxLow3x,
          AddLater(signUpViewmodel: _signUpViewmodel),
        ],
      ),
    );
  }
}
