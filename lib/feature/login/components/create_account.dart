import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/routes/route_constants.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, Routes.signUp);
        },
        child: Text(
          "Yeni Hesap Oluştur",
          style: context.textTheme.bodyText1?.copyWith(
            fontSize: context.dynamicWidth(0.04),
            decoration: TextDecoration.underline,
            decorationThickness: 1.5,
          ),
        ),
      ),
    );
  }
}
