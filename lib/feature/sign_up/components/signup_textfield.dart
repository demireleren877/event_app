import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';

import '../../login/login_constants.dart';
import '../viewmodel/sign_up_viewmodel.dart';

class SignField extends StatelessWidget {
  const SignField({
    Key? key,
    required this.signUpVM,
    required this.controller,
    required this.hintText,
    required this.onChange,
    required this.autoFill,
    required this.inputType,
    this.inputDecoration,
    this.obscureText,
    this.icon,
  }) : super(key: key);

  final SignUpVM signUpVM;
  final TextEditingController controller;
  final String hintText;
  final Function(String) onChange;
  final Iterable<String>? autoFill;
  final TextInputType inputType;
  final InputDecoration? inputDecoration;
  final bool? obscureText;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330.w,
      child: TextFormField(
        validator: hintText == "Şifre"
            ? (value) {
                if (value!.length >= 6) {
                  return null;
                } else {
                  return "Parola Minimum 6 Karakter İçermelidir";
                }
              }
            : null,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: obscureText ?? false,
        onChanged: onChange,
        controller: controller,
        autofillHints: autoFill,
        keyboardType: inputType,
        decoration: inputDecoration ??
            InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: blackTextFild,
              prefixIcon: Icon(
                icon,
                color: Colors.white38,
              ),
              hintText: hintText,
              hintStyle: context.textTheme.titleLarge?.copyWith(
                color: grayText,
              ),
            ),
      ),
    );
  }
}
