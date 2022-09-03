import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
      builder: (a) => TextFormField(
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
          contentPadding: context.paddingLow,
          filled: true,
          fillColor: const Color(0xFFACA0DF),
          prefixIcon: const Icon(
            Icons.lock,
            color: Colors.white,
          ),
          suffixIcon: IconButton(
            icon: !_loginVM.isPasswordVisible
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
            color: Colors.white,
            onPressed: () {
              _loginVM.changePasswordVisibility();
            },
          ),
          hintText: "Şifre",
          hintStyle: context.textTheme.headline6?.copyWith(
            color: Colors.black,
          ),
          border: OutlineInputBorder(
            borderRadius: context.highBorderRadius,
          ),
        ),
      ),
    );
  }
}
