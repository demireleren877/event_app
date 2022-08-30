import 'package:event_app/core/cache/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../../core/models/event_model.dart';
import 'add_fav_button.dart';
import 'date_and_hour.dart';
import 'go_back_button.dart';
import 'location.dart';
import 'sold_tickets.dart';

class EventHeader extends StatelessWidget {
  EventHeader({Key? key, required this.arguments}) : super(key: key);
  final Event arguments;
  final CacheManager _cacheManager = CacheManager<Event>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const HeaderImage(),
        const HeaderShadow(),
        Positioned(
          bottom: context.height * 0.03,
          left: context.width * 0.05,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Title(arguments: arguments),
              context.emptySizedHeightBoxLow,
              Location(arguments: arguments),
              context.emptySizedHeightBoxLow,
              DatenHour(arguments: arguments),
              context.emptySizedHeightBoxLow,
              SoldTickets(arguments: arguments)
            ],
          ),
        ),
        Container(
          padding: context.paddingNormal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const GoBackButton(),
              AddFavButton(cacheManager: _cacheManager, arguments: arguments),
            ],
          ),
        ),
      ],
    );
  }
}

class HeaderImage extends StatelessWidget {
  const HeaderImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage("assets/party.jpg"),
          fit: BoxFit.fitHeight,
        ),
        color: Colors.grey[900],
      ),
    );
  }
}

class HeaderShadow extends StatelessWidget {
  const HeaderShadow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  final Event arguments;

  @override
  Widget build(BuildContext context) {
    return Text(
      arguments.title,
      style: context.textTheme.headline5?.copyWith(
        color: Colors.white,
        fontSize: context.height * 0.04,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
