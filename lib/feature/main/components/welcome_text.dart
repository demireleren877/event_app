import 'package:event_app/core/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/cache/cache_manager.dart';

class WelcomeText extends StatelessWidget {
  WelcomeText({
    Key? key,
    required CacheManager cacheManager,
  }) : super(key: key);
  final FirebaseServices _firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _firebaseServices.getCurrentUsername(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Padding(
          padding: context.horizontalPaddingNormal,
          child: Text(
            "Merhaba ${snapshot.data}",
            style: context.textTheme.headline4,
          ),
        );
      },
    );
  }
}
