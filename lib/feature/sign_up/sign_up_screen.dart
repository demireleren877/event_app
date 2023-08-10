import 'package:event_app/feature/sign_up/viewmodel/sign_up_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import 'components/page_one.dart';
import 'components/signup_button.dart';
import 'components/signup_textfield.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);
  final SignUpVM _signUpViewmodel = SignUpVM();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Adını ve Soyadını Gir",
              style: context.textTheme.headlineMedium?.copyWith(
                color: Colors.white,
              ),
            ),
            context.emptySizedHeightBoxHigh,
            SignupTextfield(
              onChanged: (value) => _signUpViewmodel.changeName(value),
            ),
            context.emptySizedHeightBoxNormal,
            SignUpButton(
              buttonColor: const Color(0xFFACA0DF),
              textColor: Colors.black,
              text: "Devam Et",
              onPressed: () {
                if (_signUpViewmodel.name != "") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              PageOne(signUpViewmodel: _signUpViewmodel)));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Ad ve Soyad boş bırakılamaz"),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
