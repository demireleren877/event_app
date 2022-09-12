import 'package:event_app/feature/follow_requests/follow_requests_screen.dart';
import 'package:event_app/feature/home/home_page.dart';
import 'package:flutter/material.dart';

import '../../feature/login/login_screen.dart';
import '../../feature/sign_up/sign_up_screen.dart';

class Routes {
  Routes._();
  static const String init = '/init';
  static const String calendar = '/calendar';
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
  static const String updateProfile = "/updateProfile";
  static const String followRequests = "/followRequests";
  static final routes = <String, WidgetBuilder>{
    followRequests: (BuildContext context) => FollowRequestsPage(),
    home: (BuildContext context) => HomePage(),
    signUp: (BuildContext context) => SignUpPage(),
    login: (BuildContext context) => LoginScreen(),
  };
}
