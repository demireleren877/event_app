import 'package:event_app/feature/login/viewmodel/login_viewmodel.dart';
import 'package:event_app/feature/login/widget/main_button.dart';
import 'package:event_app/feature/sign_up/components/profile_image.dart';
import 'package:event_app/feature/sign_up/viewmodel/sign_up_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';

import '../login/login_constants.dart';
import 'components/signup_textfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final SignUpVM _signUpViewmodel = SignUpVM();
  final LoginVM _loginVM = LoginVM();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackBG,
      body: ListView(
        padding: context.paddingMedium,
        children: [
          Center(
            child: ProfileImage(
              signUpViewmodel: _signUpViewmodel,
            ),
          ),
          context.emptySizedHeightBoxNormal,
          SignField(
            signUpVM: _signUpViewmodel,
            controller: _nameController,
            hintText: "Ad Soyad",
            onChange: (value) => _signUpViewmodel.changeName(value),
            autoFill: const [AutofillHints.name],
            inputType: TextInputType.name,
            icon: Icons.person,
          ),
          context.emptySizedHeightBoxLow3x,
          SignField(
            signUpVM: _signUpViewmodel,
            controller: _emailController,
            hintText: "E-Mail",
            onChange: (value) => _signUpViewmodel.changeEmail(value),
            autoFill: const [AutofillHints.email],
            inputType: TextInputType.emailAddress,
            icon: Icons.email,
          ),
          context.emptySizedHeightBoxLow3x,
          SignField(
            signUpVM: _signUpViewmodel,
            controller: _usernameController,
            hintText: "Kullanıcı Adı",
            onChange: (value) => _signUpViewmodel.changeUserName(value),
            autoFill: const [AutofillHints.username],
            inputType: TextInputType.name,
            icon: Icons.person_pin,
          ),
          context.emptySizedHeightBoxLow3x,
          Observer(builder: (_) {
            return SignField(
              signUpVM: _signUpViewmodel,
              controller: _passController,
              obscureText: !_loginVM.isPasswordVisible,
              hintText: "Şifre",
              onChange: (value) => _signUpViewmodel.changePassword(value),
              autoFill: const [AutofillHints.password],
              inputType: TextInputType.text,
              inputDecoration: InputDecoration(
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
            );
          }),
          context.emptySizedHeightBoxLow3x,
          Mainbutton(
            onTap: () {
              _signUpViewmodel.createAccount(context);
            },
            text: "Kaydol",
            btnColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
