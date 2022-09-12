import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../../core/models/event_model.dart';
import 'sell_out_secion.dart';

class EventFooter extends StatelessWidget {
  const EventFooter({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  final Event arguments;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: context.height * 0.45,
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
          const AboutEvent(),
          context.emptySizedHeightBoxLow,
          const EventDetails(),
          context.emptySizedHeightBoxLow3x,
          SellOutSection(arguments: arguments),
        ],
      ),
    );
  }
}

class EventDetails extends StatelessWidget {
  const EventDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      style: context.textTheme.bodyText1?.copyWith(
        color: Colors.white54,
        fontSize: context.height * 0.025,
      ),
    );
  }
}

class AboutEvent extends StatelessWidget {
  const AboutEvent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "About the Event",
      style: context.textTheme.headline5?.copyWith(
        color: Colors.white,
        fontSize: context.height * 0.03,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
