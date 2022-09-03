import 'package:flutter/material.dart';
import '/feature/login/viewmodel/login_viewmodel.dart';
import 'package:kartal/kartal.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    Key? key,
    required LoginVM loginVM,
    required TextEditingController emailController,
  })  : _loginVM = loginVM,
        _emailController = emailController,
        super(key: key);

  final LoginVM _loginVM;
  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) => _loginVM.onEmailChange(value),
      controller: _emailController,
      autofillHints: const [AutofillHints.email],
      keyboardType: TextInputType.emailAddress,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        contentPadding: context.paddingLow,
        filled: true,
        fillColor: const Color(0xFFACA0DF),
        prefixIcon: const Icon(Icons.email, color: Colors.white),
        hintText: "Kullanıcı Adı",
        hintStyle: context.textTheme.headline6?.copyWith(
          color: Colors.black,
        ),
        border: OutlineInputBorder(
          borderRadius: context.highBorderRadius,
        ),
      ),
    );
  }
}
