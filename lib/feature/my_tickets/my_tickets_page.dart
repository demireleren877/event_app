import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_app/core/routes/route_constants.dart';
import 'package:event_app/core/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';
import 'package:ticket_material/ticket_material.dart';

import '../chat_room/chat_screen.dart';

class MyTickets extends StatelessWidget {
  const MyTickets({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          bottom: TabBar(
            padding: context.paddingNormal,
            labelColor: Colors.amber,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.amber,
            indicator: BoxDecoration(
              borderRadius: context.lowBorderRadius,
              border: Border.all(
                color: Colors.amber,
                width: 2.0,
              ),
            ),
            unselectedLabelStyle:
                context.textTheme.headline6?.copyWith(fontSize: 18.sp),
            labelStyle: context.textTheme.headline6?.copyWith(fontSize: 18.sp),
            tabs: const [
              Tab(
                text: "Active",
              ),
              Tab(
                text: "Past",
              ),
            ],
          ),
        ),
        body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: FirebaseServices.users,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return TabBarView(
                  children: [
                    MyTicketList(snapshot: snapshot),
                    MyTicketList(snapshot: snapshot),
                  ],
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}

class MyTicketList extends StatelessWidget {
  const MyTicketList({
    Key? key,
    required this.snapshot,
  }) : super(key: key);
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    final data = snapshot.data?.data();
    return ListView.builder(
      padding: context.paddingNormal,
      physics: const BouncingScrollPhysics(),
      itemCount: data!["takenTickets"].length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            TicketMaterial(
              radiusBorder: context.width * 0.035,
              shadowSize: .3,
              height: context.height * 0.2,
              leftChild: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(context.width * 0.035),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                          data["takenTickets"][index]["image"],
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(context.width * 0.035),
                      ),
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                  Center(
                    child: Text(
                      data["takenTickets"][index]["title"],
                      style: context.textTheme.headline5,
                    ),
                  ),
                ],
              ),
              rightChild: GestureDetector(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ChatScreen(
                                currentUser: "Eren Demirel",
                                currentLecture: data["takenTickets"][index]
                                        ["title"]
                                    .toString(),
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.chat_outlined),
                        iconSize: context.height * 0.045,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.ticket);
                        },
                        icon: const Icon(Icons.qr_code_rounded),
                        iconSize: context.height * 0.045,
                      )
                    ],
                  )),
              colorBackground: Colors.grey.shade900,
            ),
            context.emptySizedHeightBoxLow3x
          ],
        );
      },
    );
  }
}
