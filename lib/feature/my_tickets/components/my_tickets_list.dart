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
  final dynamic snapshot;

  @override
  Widget build(BuildContext context) {
    final docs = snapshot.data.docs;
    return docs.length == 0
        ? const NoDataIcon()
        : ListView.builder(
            key: const PageStorageKey("myTicketList"),
            padding: context.paddingNormal,
            physics: const BouncingScrollPhysics(),
            itemCount: docs.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  TicketMaterial(
                    radiusBorder: context.width * 0.035,
                    shadowSize: .3,
                    height: context.height * 0.2,
                    leftChild: LeftChild(
                      data: docs[index],
                      index: index,
                    ),
                    rightChild: RightChild(
                      data: docs[index].data(),
                      index: index,
                    ),
                    colorBackground: Colors.grey.shade900,
                  ),
                  context.emptySizedHeightBoxLow3x,
                  context.emptySizedHeightBoxLow3x
                ],
              );
            },
          );
  }
}
