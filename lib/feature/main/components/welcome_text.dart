import 'package:event_app/core/components/centered_progress.dart';
import 'package:event_app/core/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/cache/cache_manager.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    Key? key,
    required CacheManager cacheManager,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseServices.user
          .doc(FirebaseServices.auth.currentUser!.email.toString())
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          var doc = snapshot.data;
          return Padding(
            padding: context.horizontalPaddingNormal,
            child: Text(
              "Merhaba ${doc["name"]}",
              style: context.textTheme.headlineMedium,
            ),
          );
        }
        return const CenteredProgressIndicator();
      },
    );
  }
}
