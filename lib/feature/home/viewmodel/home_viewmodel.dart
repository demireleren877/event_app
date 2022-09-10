import 'package:event_app/feature/profile/profile_screen.dart';
import 'package:event_app/feature/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../calendar/calendar_page.dart';
import '../../main/main_page.dart';
import '../../my_tickets/my_tickets_page.dart';
part 'home_viewmodel.g.dart';

class HomeVM = _HomeVMBase with _$HomeVM;

abstract class _HomeVMBase with Store {
  final PageController pageController = PageController();

  final List<Widget> pages = [
    MainScreen(),
    SearchPage(),
    CalendarScreen(),
    const MyTickets(),
    const ProfilePage()
  ];

  @observable
  int selectedIndex = 0;

  @action
  void onTabChange(int index) {
    if (pageController.hasClients) {
      selectedIndex = index;
      pageController.jumpToPage(index);
    }
  }
}
