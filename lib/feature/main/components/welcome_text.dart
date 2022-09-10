import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/cache/cache_manager.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    Key? key,
    required CacheManager cacheManager,
  })  : _cacheManager = cacheManager,
        super(key: key);

  final CacheManager _cacheManager;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.horizontalPaddingNormal,
      child: Text(
        "Merhaba ${_cacheManager.getUser()} ",
        style: context.textTheme.headline4,
      ),
    );
  }
}
