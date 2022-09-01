import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        titleSpacing: 10,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text("Ticket"),
      ),
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: context.normalBorderRadius,
                color: Colors.grey[900],
              ),
              height: context.height / 1.2,
            ),
            Positioned(
              top: 0,
              child: ClipRRect(
                borderRadius: context.normalBorderRadius,
                child: const TicketHeader(),
              ),
            ),
            Positioned(
              bottom: context.height / 2.28,
              child: const DashedLine(),
            ),
            InvertCircle(
              left: -context.width / 25,
              bottom: context.height / 2.4,
            ),
            InvertCircle(
              right: -context.width / 25,
              bottom: context.height / 2.4,
            ),
            Positioned(
              bottom: context.height / 5.7,
              child: const DashedLine(),
            ),
            InvertCircle(
              left: -context.width / 25,
              bottom: context.height / 6.5,
            ),
            InvertCircle(
              right: -context.width / 25,
              bottom: context.height / 6.5,
            ),
            Positioned(
              left: context.width / 11,
              bottom: context.height / 50,
              child: const TicketFooter(),
            )
          ],
        ),
      ),
    );
  }
}

class InvertCircle extends StatelessWidget {
  const InvertCircle({
    Key? key,
    this.right,
    this.bottom,
    this.left,
    this.top,
  }) : super(key: key);
  final double? right;
  final double? left;
  final double? bottom;
  final double? top;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: right,
      bottom: bottom,
      left: left,
      top: top,
      child: CircleAvatar(
        backgroundColor: Colors.black,
        radius: context.width / 25,
      ),
    );
  }
}

class TicketHeader extends StatelessWidget {
  const TicketHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: context.height / 3,
          width: context.width / 1.17,
          child: Image.asset("assets/party.jpg", fit: BoxFit.fill),
        ),
        const Positioned(
          left: 0,
          bottom: 0,
          child: HeaderShadow(),
        ),
        const Positioned(
          bottom: 0,
          child: HeaderTitle(),
        )
      ],
    );
  }
}

class TicketFooter extends StatelessWidget {
  const TicketFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          height: context.height / 15,
          width: context.width / 1.5,
          child: Image.asset("assets/barcode.png", fit: BoxFit.fill),
        ),
        context.emptySizedHeightBoxLow,
        Text(
          "Barecode 19542157",
          style: context.textTheme.subtitle1?.copyWith(color: Colors.grey),
        )
      ],
    );
  }
}

class DashedLine extends StatelessWidget {
  const DashedLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Row(
        children: List.generate(
          1250 ~/ 10,
          (index) => Expanded(
            child: Container(
              color: index % 2 == 0 ? Colors.transparent : Colors.grey,
              height: 0.4,
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text(
            "2000s Hip Hop Night",
            style: context.textTheme.headline5?.copyWith(color: Colors.white),
          ),
          context.emptySizedHeightBoxLow,
          SizedBox(
            width: context.width * 0.8,
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
              textAlign: TextAlign.center,
              style: context.textTheme.subtitle1?.copyWith(color: Colors.grey),
            ),
          ),
        ],
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
      height: context.height * 0.4,
      width: context.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.grey.shade900.withOpacity(1),
            Colors.grey.shade900.withOpacity(0.3),
            Colors.grey.shade900.withOpacity(0.15),
            Colors.grey.shade900.withOpacity(0.0)
          ],
        ),
      ),
    );
  }
}
