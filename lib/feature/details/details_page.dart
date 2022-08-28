import 'package:event_app/core/models/event_model.dart';
import 'package:event_app/core/utilities/scroll_behavior.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Event;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: ListView(
            physics: const ClampingScrollPhysics(),
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
                              arguments.date.toDate().day.toString() +
                                  " " +
                                  DateFormat("MMMM")
                                      .format(arguments.date.toDate()) +
                                  " " +
                                  arguments.date.toDate().year.toString(),
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
                              DateFormat("hh:mm a")
                                  .format(arguments.date.toDate()),
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
                            SizedBox(
                              height: context.height * 0.05,
                              width: context.width * 0.5,
                              child: Stack(
                                children: List.generate(
                                    arguments.peoples.length, (index) {
                                  return Positioned(
                                    left: index * context.height * 0.035,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.amber,
                                      child: Text(
                                        arguments.peoples[index]["name"]
                                            .toString()
                                            .substring(0, 1),
                                        style: context.textTheme.bodyText1
                                            ?.copyWith(
                                          color: Colors.white,
                                          fontSize: context.height * 0.025,
                                        ),
                                      ),
                                      radius: context.height * 0.025,
                                    ),
                                  );
                                }),
                              ),
                            ),
                            Text(
                              "${arguments.peoples.length} Tickets Sold",
                              style: context.textTheme.bodyText1?.copyWith(
                                color: Colors.white70,
                                fontSize: context.height * 0.021,
                              ),
                            ),
                          ],
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
                constraints: BoxConstraints(
                  minHeight: context.height * 0.35,
                  maxHeight: context.height,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(context.height * 0.04),
                  ),
                ),
                padding: context.paddingNormal,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Text(
                      "About the Event",
                      style: context.textTheme.headline5?.copyWith(
                        color: Colors.white,
                        fontSize: context.height * 0.03,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    context.emptySizedHeightBoxLow,
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                      style: context.textTheme.bodyText1?.copyWith(
                        color: Colors.white54,
                        fontSize: context.height * 0.025,
                      ),
                    ),
                    context.emptySizedHeightBoxLow3x,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "₺ " + arguments.price.toString(),
                          style: context.textTheme.bodyText1?.copyWith(
                            color: Colors.pink.shade300,
                            fontSize: context.height * 0.03,
                          ),
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(
                            context.height * 0.02,
                          ),
                          elevation: 15,
                          shadowColor: Colors.pink,
                          child: TextButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    context.height * 0.02,
                                  ),
                                ),
                              ),
                              elevation: MaterialStateProperty.all(1),
                              backgroundColor: MaterialStateProperty.all(
                                Colors.pink.shade400,
                              ),
                              fixedSize: MaterialStateProperty.all(
                                Size(
                                    context.width * 0.5, context.height * 0.07),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Buy Ticket",
                              style: context.textTheme.bodyText1?.copyWith(
                                color: Colors.white,
                                fontSize: context.height * 0.025,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
