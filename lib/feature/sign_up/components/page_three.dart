import 'package:event_app/feature/sign_up/components/signup_button.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../viewmodel/sign_up_viewmodel.dart';

class PageThree extends StatelessWidget {
  const PageThree({
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
            "Aramıza hoşgeldin \n @${_signUpViewmodel.userName} !",
            style: context.textTheme.headline4,
            textAlign: TextAlign.center,
          ),
          context.emptySizedHeightBoxNormal,
          Image.asset("assets/welcome.png"),
          context.emptySizedHeightBoxLow3x,
          SignUpButton(
            text: "Devaam Et",
            onPressed: () {
              _signUpViewmodel.pageController.nextPage(
                duration: context.durationLow,
                curve: Curves.easeIn,
              );
              FocusScope.of(context).unfocus();
            },
          ),
        ],
      ),
    );
  }
}
