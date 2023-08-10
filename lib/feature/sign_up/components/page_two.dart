import 'package:event_app/feature/sign_up/components/page_three.dart';
import 'package:event_app/feature/sign_up/components/signup_button.dart';
import 'package:event_app/feature/sign_up/components/signup_textfield.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../viewmodel/sign_up_viewmodel.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({
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
              "Mail ve Şifreni Gir",
              textAlign: TextAlign.center,
              style: context.textTheme.headlineMedium?.copyWith(
                color: Colors.white,
              ),
            ),
            context.emptySizedHeightBoxHigh,
            SignupTextfield(
                onChanged: (value) => signUpViewmodel.changeEmail(value),
                hintText: "Mail Adresi"),
            context.emptySizedHeightBoxLow3x,
            SignupTextfield(
                onChanged: (value) => signUpViewmodel.changePassword(value),
                hintText: "Şifre"),
            context.emptySizedHeightBoxNormal,
            SignUpButton(
              textColor: Colors.black,
              buttonColor: const Color(0xFFACA0DF),
              text: "Devam Et",
              onPressed: () {
                if (signUpViewmodel.email != "" &&
                    signUpViewmodel.password != "") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          PageThree(signUpViewmodel: signUpViewmodel),
                    ),
                  );
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
      ),
    );
  }
}
