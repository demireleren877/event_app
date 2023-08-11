import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';
import '../login_constants.dart';
import '/feature/login/viewmodel/login_viewmodel.dart';

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
    return SizedBox(
      width: 330.w,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: (value) => _loginVM.onEmailChange(value),
        controller: _emailController,
        autofillHints: const [AutofillHints.email],
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: blackTextFild,
          prefixIcon: const Icon(
            Icons.mail,
            color: Colors.white38,
          ),
          hintText: "E-Mail",
          hintStyle: context.textTheme.titleLarge?.copyWith(
            color: grayText,
          ),
        ),
      ),
    );
  }
}
