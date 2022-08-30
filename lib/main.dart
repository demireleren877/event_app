import 'package:event_app/core/models/event_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/routes/route_constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  await Hive.initFlutter();
  Hive.registerAdapter(EventAdapter());
  await Hive.openBox('events');
  await Hive.openBox('users');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        theme: ThemeData.dark().copyWith(
          colorScheme: ThemeData().colorScheme.copyWith(primary: Colors.white),
        ),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: Routes.home,
        routes: Routes.routes,
      ),
    );
  }
}
