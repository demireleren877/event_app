import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/routes/route_constants.dart';
import '../viewmodel/sign_up_viewmodel.dart';

class AddLater extends StatelessWidget {
  const AddLater({
    Key? key,
    required SignUpVM signUpViewmodel,
  })  : _signUpViewmodel = signUpViewmodel,
        super(key: key);

  final SignUpVM _signUpViewmodel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _signUpViewmodel
            .createAccount(context)
            .then((value) => Navigator.pushNamed(context, Routes.home));
      },
      child: Text(
        "Daha Sonra",
        style: context.textTheme.bodyText1?.copyWith(
          fontSize: context.dynamicWidth(0.04),
          decoration: TextDecoration.underline,
          decorationThickness: 1.5,
        ),
      ),
    );
  }
}
