import 'package:event_app/core/cache/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:ticket_material/ticket_material.dart';

class MyTickets extends StatelessWidget {
  MyTickets({Key? key}) : super(key: key);
  final CacheManager _cacheManager = CacheManager();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          bottom: TabBar(
            padding: context.paddingNormal,
            labelColor: Colors.amber,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.amber,
            indicator: BoxDecoration(
              borderRadius: context.lowBorderRadius,
              border: Border.all(
                color: Colors.amber,
                width: 2.0,
              ),
            ),
            unselectedLabelStyle:
                context.textTheme.headline6?.copyWith(fontSize: 18.sp),
            labelStyle: context.textTheme.headline6?.copyWith(fontSize: 18.sp),
            tabs: [
              Tab(
                height: context.dynamicHeight(0.04),
                text: "Active",
              ),
              const Tab(
                text: "Past",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            MyTicketList(),
            MyTicketList(),
          ],
        ),
      ),
    );
  }
}

class MyTicketList extends StatelessWidget {
  const MyTicketList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box("events").listenable(),
      builder: (context, Box eventBox, _) => eventBox.length != 0
          ? ListView.builder(
              padding: context.paddingNormal,
              physics: const BouncingScrollPhysics(),
              itemCount: eventBox.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    TicketMaterial(
                      radiusBorder: context.width * 0.035,
                      shadowSize: .3,
                      height: context.height * 0.2,
                      leftChild: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(context.width * 0.035),
                              ),
                              image: DecorationImage(
                                image: NetworkImage(
                                  eventBox.getAt(index).image,
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(context.width * 0.035),
                              ),
                              color: Colors.black.withOpacity(0.7),
                            ),
                          ),
                          Center(
                            child: Text(
                              eventBox.getAt(index).title,
                              style: context.textTheme.headline5,
                            ),
                          ),
                        ],
                      ),
                      rightChild: Center(
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            "53879566",
                            style: context.textTheme.headline6,
                          ),
                        ),
                      ),
                      colorBackground: Colors.grey.shade900,
                    ),
                    context.emptySizedHeightBoxLow3x
                  ],
                );
              },
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.do_not_disturb_alt,
                  size: 100.sp,
                ),
              ],
            ),
    );
  }
}
