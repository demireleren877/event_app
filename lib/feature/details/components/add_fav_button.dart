import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kartal/kartal.dart';

import '../../../core/cache/cache_manager.dart';
import '../../../core/models/event_model.dart';

class AddFavButton extends StatelessWidget {
  const AddFavButton({
    Key? key,
    required CacheManager cacheManager,
    required this.arguments,
  })  : _cacheManager = cacheManager,
        super(key: key);

  final CacheManager _cacheManager;
  final Event arguments;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddingNormal,
      child: CircleAvatar(
        radius: context.height * 0.03,
        backgroundColor: Colors.white24,
        child: IconButton(
          color: Colors.white,
          icon: const Icon(
            Icons.favorite,
            size: 30,
          ),
          onPressed: () {
            _cacheManager.isExist(arguments.id, "events")
                ? null
                : _cacheManager.saveHive(
                    arguments,
                    arguments.id,
                    Hive.box("events"),
                  );
          },
        ),
      ),
    );
  }
}
