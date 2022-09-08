import 'package:event_app/feature/sign_up/components/signup_button.dart';
import 'package:event_app/feature/sign_up/components/signup_textfield.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../viewmodel/sign_up_viewmodel.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({
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
            "Mail ve Şifreni Gir",
            textAlign: TextAlign.center,
            style: context.textTheme.headline4?.copyWith(
              color: Colors.white,
            ),
          ),
          context.emptySizedHeightBoxHigh,
          SignupTextfield(
              onChanged: (value) => _signUpViewmodel.changeEmail(value),
              hintText: "Mail Adresi"),
          context.emptySizedHeightBoxLow3x,
          SignupTextfield(
              onChanged: (value) => _signUpViewmodel.changePassword(value),
              hintText: "Şifre"),
          context.emptySizedHeightBoxNormal,
          SignUpButton(
            textColor: Colors.black,
            buttonColor: const Color(0xFFACA0DF),
            text: "Devam Et",
            onPressed: () {
              if (_signUpViewmodel.email != "" &&
                  _signUpViewmodel.password != "") {
                _signUpViewmodel.pageController.nextPage(
                  duration: context.durationLow,
                  curve: Curves.easeIn,
                );
                FocusScope.of(context).unfocus();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Boş Alan Bırakmayınız."),
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
