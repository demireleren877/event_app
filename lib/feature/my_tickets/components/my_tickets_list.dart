import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:ticket_material/ticket_material.dart';

import 'left_child.dart';
import 'no_data_icon.dart';
import 'right_child.dart';

class MyTicketList extends StatelessWidget {
  const MyTicketList({
    Key? key,
    required this.snapshot,
  }) : super(key: key);
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    final data = snapshot.data?.data();
    return data["takenTickets"] == null
        ? const NoDataIcon()
        : ListView.builder(
            padding: context.paddingNormal,
            physics: const BouncingScrollPhysics(),
            itemCount:
                data["takenTickets"] == null ? 0 : data["takenTickets"].length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  TicketMaterial(
                    radiusBorder: context.width * 0.035,
                    shadowSize: .3,
                    height: context.height * 0.2,
                    leftChild: LeftChild(
                      data: data,
                      index: index,
                    ),
                    rightChild: RightChild(
                      data: data,
                      index: index,
                    ),
                    colorBackground: Colors.grey.shade900,
                  ),
                  context.emptySizedHeightBoxLow3x
                ],
              );
            },
          );
  }
}
