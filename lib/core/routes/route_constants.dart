import 'package:event_app/feature/details/details_page.dart';
import 'package:event_app/feature/home/home_page.dart';
import 'package:event_app/feature/my_tickets/my_tickets_page.dart';
import 'package:event_app/feature/ticket/ticket_page.dart';
import 'package:flutter/material.dart';

import '../../feature/login/login_screen.dart';
import '../../feature/profile/profile_screen.dart';
import '../../feature/search/search_screen.dart';
import '../../feature/sign_up/sign_up_screen.dart';

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
  static final routes = <String, WidgetBuilder>{
    search: (BuildContext context) => const SearchPage(),
    profile: (BuildContext context) => const ProfilePage(),
    home: (BuildContext context) => HomePage(),
    ticket: (BuildContext context) => const TicketPage(),
    signUp: (BuildContext context) => SignUpPage(),
    myTickets: (BuildContext context) => const MyTickets(),
    login: (BuildContext context) => LoginScreen(),
    eventDetail: (BuildContext context) => const EventDetails(),
  };
}
