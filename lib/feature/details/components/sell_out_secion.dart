import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../../core/models/event_model.dart';

class SellOutSection extends StatelessWidget {
  const SellOutSection({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  final Event arguments;

  @override
  Widget build(BuildContext context) {
    return Row(
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
                Size(context.width * 0.5, context.height * 0.07),
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
    );
  }
}
