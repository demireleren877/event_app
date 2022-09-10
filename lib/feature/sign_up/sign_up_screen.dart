import 'package:event_app/feature/sign_up/components/first_step.dart';
import 'package:event_app/feature/sign_up/viewmodel/sign_up_viewmodel.dart';
import 'package:flutter/material.dart';

import 'components/page_four.dart';
import 'components/page_one.dart';
import 'components/page_three.dart';
import 'components/page_two.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);
  final SignUpVM _signUpViewmodel = SignUpVM();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PageView(
          controller: _signUpViewmodel.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            FirstStep(signUpViewmodel: _signUpViewmodel),
            PageOne(signUpViewmodel: _signUpViewmodel),
            PageTwo(signUpViewmodel: _signUpViewmodel),
            PageThree(signUpViewmodel: _signUpViewmodel),
            PageFour(signUpViewmodel: _signUpViewmodel),
          ],
        ),
      ),
    );
  }
}
