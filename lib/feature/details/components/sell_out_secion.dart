import 'package:event_app/core/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../../core/models/event_model.dart';

class SellOutSection extends StatelessWidget {
  SellOutSection({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  final Event arguments;
  final FirebaseServices _firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "₺ ${arguments.price}",
          style: context.textTheme.bodyLarge?.copyWith(
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
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      "Satın Al",
                      style: context.textTheme.titleLarge?.copyWith(
                        color: Colors.pink.shade300,
                      ),
                    ),
                    content: Text(
                      "Satın almak istediğinize emin misiniz?",
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: Colors.pink.shade300,
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Hayır",
                          style: context.textTheme.bodyLarge?.copyWith(
                            color: Colors.pink.shade300,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          _firebaseServices.buyTicket(arguments.id);
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Evet",
                          style: context.textTheme.bodyLarge?.copyWith(
                            color: Colors.pink.shade300,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text(
              "Buy Ticket",
              style: context.textTheme.bodyLarge?.copyWith(
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
