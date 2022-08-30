import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/models/event_model.dart';

class SoldTickets extends StatelessWidget {
  const SoldTickets({Key? key, required this.arguments}) : super(key: key);
  final Event arguments;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: context.height * 0.05,
          width: context.width * 0.5,
          child: Stack(
            children: List.generate(arguments.peoples.length, (index) {
              return Positioned(
                left: index * context.height * 0.035,
                child: CircleAvatar(
                  backgroundColor: Colors.amber,
                  child: Text(
                    arguments.peoples[index]["name"].toString().substring(0, 1),
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
        ),
        Text(
          "${arguments.peoples.length} Tickets Sold",
          style: context.textTheme.bodyText1?.copyWith(
            color: Colors.white70,
            fontSize: context.height * 0.021,
          ),
        ),
      ],
    );
  }
}
