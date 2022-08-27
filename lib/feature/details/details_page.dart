import 'package:event_app/core/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Event;
    print(arguments.peoples);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.65,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage("assets/party.jpg"),
                      fit: BoxFit.fitHeight,
                    ),
                    color: Colors.grey[900],
                  ),
                ),
                Container(
                  height: context.height * 0.65,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(1),
                        Colors.black.withOpacity(0.0),
                        Colors.black.withOpacity(0.3),
                        Colors.black.withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: context.height * 0.03,
                  left: context.width * 0.05,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        arguments.title,
                        style: context.textTheme.headline5?.copyWith(
                          color: Colors.white,
                          fontSize: context.height * 0.04,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      context.emptySizedHeightBoxLow,
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.pink.shade700,
                            size: context.height * 0.033,
                          ),
                          context.emptySizedWidthBoxLow3x,
                          Text(
                            arguments.detail,
                            style: context.textTheme.bodyText1?.copyWith(
                              color: Colors.white54,
                              fontSize: context.height * 0.021,
                            ),
                          ),
                        ],
                      ),
                      context.emptySizedHeightBoxLow,
                      Row(
                        children: [
                          Icon(
                            Icons.date_range_outlined,
                            color: Colors.pink.shade700,
                            size: context.height * 0.033,
                          ),
                          context.emptySizedWidthBoxLow3x,
                          Text(
                            "25 Haziran 2022",
                            style: context.textTheme.bodyText1?.copyWith(
                              color: Colors.white54,
                              fontSize: context.height * 0.021,
                            ),
                          ),
                          context.emptySizedWidthBoxHigh,
                          Icon(
                            Icons.access_time_outlined,
                            color: Colors.pink.shade700,
                            size: context.height * 0.033,
                          ),
                          context.emptySizedWidthBoxLow3x,
                          Text(
                            "12:00",
                            style: context.textTheme.bodyText1?.copyWith(
                              color: Colors.white54,
                              fontSize: context.height * 0.021,
                            ),
                          ),
                        ],
                      ),
                      context.emptySizedHeightBoxLow,
                      SizedBox(
                        height: context.height * 0.05,
                        width: context.width,
                        child: Stack(
                          children:
                              List.generate(arguments.peoples.length, (index) {
                            return Positioned(
                              left: index * context.height * 0.045,
                              child: CircleAvatar(
                                backgroundColor: Colors.amber,
                                child: Text(
                                  arguments.peoples[index]["name"]
                                      .toString()
                                      .substring(0, 1),
                                  style: context.textTheme.bodyText1?.copyWith(
                                    color: Colors.white,
                                    fontSize: context.height * 0.025,
                                  ),
                                ),
                                radius: context.height * 0.025,
                              ),
                            );
                          }),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: context.paddingNormal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: context.height * 0.03,
                        backgroundColor: Colors.white24,
                        child: IconButton(
                          color: Colors.white,
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Container(
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
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: context.height * 0.35,
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(context.height * 0.04),
                ),
              ),
              padding: context.paddingNormal,
            ),
          ],
        ),
      ),
    );
  }
}
