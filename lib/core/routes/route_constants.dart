import 'package:event_app/feature/details/details_page.dart';
import 'package:event_app/feature/home/home_page.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();
  static const String init = '/init';
  static const String home = '/home';
  static const String eventDetail = "/eventDetail";
  static final routes = <String, WidgetBuilder>{
    home: (BuildContext context) => HomePage(),
    eventDetail: (BuildContext context) => const EventDetails(),
  };
}
