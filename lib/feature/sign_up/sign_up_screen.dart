import 'package:event_app/feature/sign_up/viewmodel/sign_up_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);
  final SignUpVM _signUpViewmodel = SignUpVM();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PageView(
          controller: _signUpViewmodel.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            PageOne(signUpViewmodel: _signUpViewmodel),
            Container(
              color: Colors.blue,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    print(_signUpViewmodel.userName);
                  },
                  child: const Text("2"),
                ),
              ),
            ),
            Container(
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({
    Key? key,
    required SignUpVM signUpViewmodel,
  })  : _signUpViewmodel = signUpViewmodel,
        super(key: key);

  final SignUpVM _signUpViewmodel;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Kullanıcı adını oluştur",
            style: context.textTheme.headline4?.copyWith(
              color: Colors.white,
            ),
          ),
          context.emptySizedHeightBoxHigh,
          Text(
            "Hesabın için bir kullanıcı adı seç.\nDaha sonra dilediğin zaman değiştirebilirsin.",
            textAlign: TextAlign.center,
            style: context.textTheme.bodyLarge?.copyWith(
              color: Colors.white,
            ),
          ),
          context.emptySizedHeightBoxHigh,
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.dynamicWidth(0.13),
            ),
            child: TextField(
              onChanged: (value) => _signUpViewmodel.changeUserName(value),
              decoration: InputDecoration(
                contentPadding: context.paddingLow,
                filled: true,
                fillColor: const Color(0xFF7860E1),
                border: OutlineInputBorder(
                  borderRadius: context.lowBorderRadius,
                ),
              ),
            ),
          ),
          context.emptySizedHeightBoxNormal,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: context.dynamicHeight(0.06),
                width: context.dynamicWidth(0.6),
                child: TextButton(
                  onPressed: () {
                    if (_signUpViewmodel.userName != "") {
                      _signUpViewmodel.pageController.nextPage(
                        duration: context.durationLow,
                        curve: Curves.easeIn,
                      );
                      FocusScope.of(context).unfocus();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Kullanıcı adı boş bırakılamaz"),
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Devam Et",
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      fontSize: context.dynamicWidth(0.04),
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFFACA0DF)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: context.lowBorderRadius,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
