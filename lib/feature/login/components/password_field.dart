import 'package:event_app/feature/login/login_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/feature/login/viewmodel/login_viewmodel.dart';
import 'package:kartal/kartal.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    Key? key,
    required LoginVM loginVM,
    required TextEditingController passwordController,
  })  : _loginVM = loginVM,
        _passwordController = passwordController,
        super(key: key);

  final LoginVM _loginVM;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (a) => SizedBox(
        width: 330.w,
        child: TextFormField(
          obscureText: !_loginVM.isPasswordVisible,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (value) => _loginVM.onPasswordChange(value),
          controller: _passwordController,
          autofillHints: const [AutofillHints.password],
          validator: (value) {
            if (value!.length >= 6) {
              return null;
            } else {
              return "Parola Minimum 6 Karakter İçermelidir";
            }
          },
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: blackTextFild,
            prefixIcon: const Icon(
              Icons.lock,
              color: Colors.white38,
            ),
            suffixIcon: IconButton(
              icon: !_loginVM.isPasswordVisible
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility),
              color: Colors.white38,
              onPressed: () {
                _loginVM.changePasswordVisibility();
              },
            ),
            hintText: "Şifre",
            hintStyle: context.textTheme.titleLarge?.copyWith(
              color: grayText,
            ),
          ),
        ),
      ),
    );
  }
}
