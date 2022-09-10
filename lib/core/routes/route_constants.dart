import 'package:event_app/feature/details/details_page.dart';
import 'package:event_app/feature/home/home_page.dart';
import 'package:event_app/feature/menu_page/menu_screen.dart';
import 'package:event_app/feature/my_tickets/my_tickets_page.dart';
import 'package:event_app/feature/ticket/ticket_page.dart';
import 'package:flutter/material.dart';

import '../../feature/login/login_screen.dart';
import '../../feature/profile/profile_screen.dart';
import '../../feature/search/search_screen.dart';
import '../../feature/sign_up/sign_up_screen.dart';
import '../../feature/somebodys_profile/sb_profile.dart';

class Routes {
  Routes._();
  static const String init = '/init';
  static const String ticket = '/ticket';
  static const String home = '/home';
  static const String myTickets = '/myTickets';
  static const String eventDetail = "/eventDetail";
  static const String signUp = "/signUp";
  static const String login = "/login";
  static const String profile = "/profile";
  static const String search = "/search";
  static const String menu = "/menu";
  static const String splash = "/splash";
  static const String someBodysProfile = "/somebodysProfile";
  static final routes = <String, WidgetBuilder>{
    someBodysProfile: (BuildContext context) => const SomeBodysProfile(),
    menu: (BuildContext context) => const MenuPage(),
    search: (BuildContext context) => SearchPage(),
    profile: (BuildContext context) => const ProfilePage(),
    home: (BuildContext context) => HomePage(),
    ticket: (BuildContext context) => const TicketPage(),
    signUp: (BuildContext context) => SignUpPage(),
    myTickets: (BuildContext context) => const MyTickets(),
    login: (BuildContext context) => LoginScreen(),
    eventDetail: (BuildContext context) => const EventDetails(),
  };
}
