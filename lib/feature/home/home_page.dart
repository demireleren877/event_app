import 'package:event_app/feature/home/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'components/bottom_navbar.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomeVM _homeVM = HomeVM();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        backgroundColor: Colors.black,
        bottomNavigationBar: BottomNavBar(homeVM: _homeVM),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _homeVM.pageController,
          children: _homeVM.pages,
        ),
      );
    });
  }
}
