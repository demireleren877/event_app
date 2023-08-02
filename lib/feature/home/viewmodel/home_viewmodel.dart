import 'package:event_app/feature/profile/profile_screen.dart';
import 'package:event_app/feature/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../calendar/calendar_page.dart';
import '../../main/main_page.dart';
import '../../my_tickets/my_tickets_page.dart';
import '../components/profile_image.dart';
part 'home_viewmodel.g.dart';

class HomeVM = _HomeVMBase with _$HomeVM;

abstract class _HomeVMBase with Store {
  final List<Widget> pages = [
    MainScreen(),
    SearchPage(),
    CalendarScreen(),
    const MyTickets(),
    const ProfilePage()
  ];

  final List<PersistentBottomNavBarItem> items = [
    PersistentBottomNavBarItem(
      icon: const ImageIcon(
        AssetImage("assets/featured.png"),
      ),
      title: ("Home"),
      activeColorPrimary: Colors.pink.shade600,
      inactiveColorPrimary: Colors.white,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.search),
      title: ("Search"),
      activeColorPrimary: Colors.pink.shade600,
      inactiveColorPrimary: Colors.white,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.calendar_today_outlined),
      title: ("Calendar"),
      activeColorPrimary: Colors.pink.shade600,
      inactiveColorPrimary: Colors.white,
    ),
    PersistentBottomNavBarItem(
      icon: const ImageIcon(
        AssetImage("assets/tickets.png"),
      ),
      title: ("My Tickets"),
      activeColorPrimary: Colors.pink.shade600,
      inactiveColorPrimary: Colors.white,
    ),
    PersistentBottomNavBarItem(
      icon: const AppBarProfileImage(),
      title: ("Profile"),
      activeColorPrimary: Colors.pink.shade600,
      inactiveColorPrimary: Colors.white,
    ),
  ];
}
