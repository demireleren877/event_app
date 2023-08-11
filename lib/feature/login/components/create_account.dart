import 'package:event_app/feature/sign_up/sign_up_screen.dart';
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
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => SignUpPage()));
        },
        child: Text(
          "Yeni Hesap Oluştur",
          style: context.textTheme.bodyLarge?.copyWith(
            fontSize: context.dynamicWidth(0.04),
            decoration: TextDecoration.underline,
            decorationThickness: 1.5,
          ),
        ),
      ),
    );
  }
}
