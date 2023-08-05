import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        radius: context.height * 0.032,
        backgroundColor: Colors.white24,
        child: ValueListenableBuilder(
          valueListenable: Hive.box("events").listenable(),
          builder: (context, Box box, _) => IconButton(
            padding: EdgeInsets.zero,
            color: _cacheManager.isExist(arguments.id, "events")
                ? Colors.red
                : Colors.white,
            icon:  Icon(
              Icons.favorite,
              size: 30.sp,
            ),
            onPressed: () {
              _cacheManager.isExist(arguments.id, "events")
                  ? _cacheManager.deleteHive(arguments.id, box)
                  : _cacheManager.saveHive(
                      arguments,
                      arguments.id,
                      Hive.box("events"),
                    );
            },
          ),
        ),
      ),
    );
  }
}
