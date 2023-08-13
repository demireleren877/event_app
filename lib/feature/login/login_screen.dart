import 'package:event_app/feature/login/components/email_field.dart';
import 'package:event_app/feature/login/components/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';
import '../login/viewmodel/login_viewmodel.dart';
import 'login_constants.dart';
import 'widget/main_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final GlobalKey _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LoginVM _loginVM = LoginVM();
  TextEditingController userName = TextEditingController();
  TextEditingController userPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   resizeToAvoidBottomInset: false,
    //   backgroundColor: Colors.black,
    //   body: Stack(
    //     children: [
    //       Positioned(
    //         bottom: -context.dynamicHeight(0.08),
    //         child: Image.asset(
    //           "assets/login_bg.png",
    //         ),
    //       ),
    //       Form(
    //         //key: _formKey,
    //         child: Padding(
    //           padding: context.paddingMedium,
    //           child: ScrollConfiguration(
    //             behavior: MyBehavior(),
    //             child: ListView(
    //               padding: context.horizontalPaddingNormal,
    //               children: [
    //                 context.emptySizedHeightBoxNormal,
    //                 Center(
    //                   child: Text(
    //                     "Partyle",
    //                     style: context.textTheme.displayMedium?.copyWith(
    //                       color: Colors.white,
    //                       letterSpacing: 3,
    //                       fontWeight: FontWeight.w700,
    //                     ),
    //                   ),
    //                 ),
    //                 context.emptySizedHeightBoxLow3x,
    //                 EmailField(
    //                   loginVM: _loginVM,
    //                   emailController: _emailController,
    //                 ),
    //                 context.emptySizedHeightBoxLow,
    //                 PasswordField(
    //                   loginVM: _loginVM,
    //                   passwordController: _passwordController,
    //                 ),
    //                 context.emptySizedHeightBoxLow3x,
    //                 LoginButton(loginVM: _loginVM, formKey: _formKey),
    //                 context.emptySizedHeightBoxLow,
    //                 const CreateAccount(),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
    return Scaffold(
      backgroundColor: blackBG,
      body: Padding(
        padding: EdgeInsets.only(top: 50.h),
        child: SingleChildScrollView(
          child: Column(
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
              context.emptySizedHeightBoxNormal,
              EmailField(loginVM: _loginVM, emailController: _emailController),
              context.emptySizedHeightBoxLow,
              PasswordField(
                  loginVM: _loginVM, passwordController: _passwordController),
              context.emptySizedHeightBoxLow,
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot Password?',
                      style: headline3,
                    ),
                  ),
                ),
              ),
              context.emptySizedHeightBoxLow,
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Mainbutton(
                      onTap: () {
                        _loginVM.authentication(context);
                      },
                      text: 'Sign in',
                      btnColor: blueButton,
                    ),
                    context.emptySizedHeightBoxLow,
                    TextButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (builder) => SignUpPage()));
                      },
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Don\' have an account? ',
                            style: headline.copyWith(
                              fontSize: 14.0,
                            ),
                          ),
                          TextSpan(
                            text: ' Sign Up',
                            style: headlineDot.copyWith(
                              fontSize: 14.0,
                            ),
                          ),
                        ]),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
