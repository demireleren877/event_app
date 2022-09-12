import 'package:event_app/feature/home/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomeVM _homeVM = HomeVM();

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller = PersistentTabController(
      initialIndex: 0,
    );
    return Scaffold(
      backgroundColor: Colors.black,
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _homeVM.pages,
        items: _homeVM.items,
        confineInSafeArea: true,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        backgroundColor: Colors.black,
        hideNavigationBarWhenKeyboardShows: true,
        margin: const EdgeInsets.all(0.0),
        popActionScreens: PopActionScreensType.once,
        bottomScreenMargin: 0.0,
        selectedTabScreenContext: (context) {
          context = context;
        },

        popAllScreensOnTapOfSelectedTab: true,

        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style13, // Choose the nav bar style with this property
      ),
    );
  }
}




// PageView(
//         physics: const NeverScrollableScrollPhysics(),
//         controller: _homeVM.pageController,
//         children: _homeVM.pages,
//       ),
