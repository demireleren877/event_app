import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../viewmodel/sign_up_viewmodel.dart';
import 'signup_button.dart';
import 'signup_textfield.dart';

class PageOne extends StatelessWidget {
  const PageOne({
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
            "Kullanıcı adını oluştur",
            style: context.textTheme.headline4?.copyWith(
              color: Colors.white,
            ),
          ),
          context.emptySizedHeightBoxHigh,
          Text(
            "Hesabın için bir kullanıcı adı seç.\nDaha sonra dilediğin zaman değiştirebilirsin.",
            textAlign: TextAlign.center,
            style: context.textTheme.bodyLarge?.copyWith(
              color: Colors.white,
            ),
          ),
          context.emptySizedHeightBoxHigh,
          SignupTextfield(
            onChanged: (value) => _signUpViewmodel.changeUserName(value),
          ),
          context.emptySizedHeightBoxNormal,
          SignUpButton(
            buttonColor: const Color(0xFFACA0DF),
            textColor: Colors.black,
            text: "Devam Et",
            onPressed: () {
              if (_signUpViewmodel.userName != "") {
                print(_signUpViewmodel.name);
                _signUpViewmodel.pageController.nextPage(
                  duration: context.durationLow,
                  curve: Curves.easeIn,
                );
                FocusScope.of(context).unfocus();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Kullanıcı adı boş bırakılamaz"),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
