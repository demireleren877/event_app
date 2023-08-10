import 'package:event_app/feature/sign_up/components/page_two.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../viewmodel/sign_up_viewmodel.dart';
import 'signup_button.dart';
import 'signup_textfield.dart';

class PageOne extends StatelessWidget {
  const PageOne({
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
              "Kullanıcı adını oluştur",
              style: context.textTheme.headlineMedium?.copyWith(
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
              onChanged: (value) => signUpViewmodel.changeUserName(value),
            ),
            context.emptySizedHeightBoxNormal,
            SignUpButton(
              buttonColor: const Color(0xFFACA0DF),
              textColor: Colors.black,
              text: "Devam Et",
              onPressed: () {
                if (signUpViewmodel.userName != "") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              PageTwo(signUpViewmodel: signUpViewmodel)));
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
      ),
    );
  }
}
