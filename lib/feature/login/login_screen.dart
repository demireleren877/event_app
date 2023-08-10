import 'package:event_app/core/utilities/scroll_behavior.dart';
import 'package:flutter/material.dart';
import '../login/viewmodel/login_viewmodel.dart';
import '../login/components/login_button.dart';
import 'components/create_account.dart';
import 'components/email_field.dart';
import 'package:kartal/kartal.dart';
import 'components/password_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final GlobalKey _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LoginVM _loginVM = LoginVM();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            bottom: -context.dynamicHeight(0.08),
            child: Image.asset(
              "assets/login_bg.png",
            ),
          ),
          Form(
            //key: _formKey,
            child: Padding(
              padding: context.paddingMedium,
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: ListView(
                  padding: context.horizontalPaddingNormal,
                  children: [
                    context.emptySizedHeightBoxNormal,
                    Center(
                      child: Text(
                        "Partyle",
                        style: context.textTheme.displayMedium?.copyWith(
                          color: Colors.white,
                          letterSpacing: 3,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    context.emptySizedHeightBoxLow3x,
                    EmailField(
                      loginVM: _loginVM,
                      emailController: _emailController,
                    ),
                    context.emptySizedHeightBoxLow,
                    PasswordField(
                      loginVM: _loginVM,
                      passwordController: _passwordController,
                    ),
                    context.emptySizedHeightBoxLow3x,
                    LoginButton(loginVM: _loginVM, formKey: _formKey),
                    context.emptySizedHeightBoxLow,
                    const CreateAccount(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
