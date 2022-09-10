import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_app/core/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/models/event_model.dart';

class SoldTickets extends StatelessWidget {
  const SoldTickets({Key? key, required this.arguments}) : super(key: key);
  final Event arguments;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseServices().getUsersForEvent(arguments.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final docs = snapshot.data!.docs;
            return Row(
              children: [
                SizedBox(
                  height: context.height * 0.05,
                  width: context.width * 0.5,
                  child: Stack(
                    children: List.generate(docs.length, (index) {
                      return Positioned(
                        left: index * context.height * 0.035,
                        child: CircleAvatar(
                          backgroundColor: Colors.amber,
                          backgroundImage:
                              NetworkImage(docs[index]['profileImageUrl']),
                          radius: context.height * 0.025,
                        ),
                      );
                    }),
                  ),
                ),
                Text(
                  "${docs.length} Tickets Sold",
                  style: context.textTheme.bodyText1?.copyWith(
                    color: Colors.white70,
                    fontSize: context.height * 0.021,
                  ),
                ),
              ],
            );
          } else {
            return const Text('0 Sold Tickets');
          }
        });
  }
}
