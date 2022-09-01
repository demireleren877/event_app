import 'package:event_app/feature/details/details_page.dart';
import 'package:event_app/feature/home/home_page.dart';
import 'package:event_app/feature/my_tickets/my_tickets_page.dart';
import 'package:event_app/feature/ticket/ticket_page.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();
  static const String init = '/init';
  static const String ticket = '/ticket';
  static const String home = '/home';
  static const String myTickets = '/myTickets';
  static const String eventDetail = "/eventDetail";
  static final routes = <String, WidgetBuilder>{
    home: (BuildContext context) => HomePage(),
    ticket: (BuildContext context) => const TicketPage(),
    myTickets: (BuildContext context) => MyTickets(),
    eventDetail: (BuildContext context) => const EventDetails(),
  };
}
