import 'package:event_app/feature/sign_up/components/page_four.dart';
import 'package:event_app/feature/sign_up/components/signup_button.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../viewmodel/sign_up_viewmodel.dart';

class PageThree extends StatelessWidget {
  const PageThree({
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
              "Aramıza hoşgeldin \n @${signUpViewmodel.userName} !",
              style: context.textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            context.emptySizedHeightBoxNormal,
            Image.asset("assets/welcome.png"),
            context.emptySizedHeightBoxLow3x,
            SignUpButton(
              buttonColor: const Color(0xFFACA0DF),
              textColor: Colors.black,
              text: "Devam Et",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PageFour(signUpViewmodel: signUpViewmodel),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
