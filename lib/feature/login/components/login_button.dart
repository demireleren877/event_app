import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/feature/login/viewmodel/login_viewmodel.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(
      {Key? key, required LoginVM loginVM, required GlobalKey formKey})
      : _loginVM = loginVM,
        _formkey = formKey,
        super(key: key);

  final LoginVM _loginVM;
  final GlobalKey _formkey;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 45.h,
          width: 175.w,
          child: TextButton(
            onPressed: () {
              _loginVM.authentication(context);
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xFFF951C1)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            child: const Text(
              "Giriş Yap",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
