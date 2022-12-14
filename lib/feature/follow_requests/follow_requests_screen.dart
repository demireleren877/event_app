import 'package:event_app/core/components/centered_progress.dart';
import 'package:event_app/core/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class FollowRequestsPage extends StatelessWidget {
  FollowRequestsPage({Key? key}) : super(key: key);
  final FirebaseServices _firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: StreamBuilder(
        stream: FirebaseServices.user
            .doc(FirebaseServices.auth.currentUser!.email)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            final docs = snapshot.data;
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.only(top: context.height * 0.06),
                    padding: context.paddingNormal,
                    child: Text(
                      'Bildirimler',
                      style: context.textTheme.headline4!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: context.horizontalPaddingNormal,
                    itemCount: docs["followers"].length,
                    itemBuilder: (BuildContext context, int index) {
                      return FutureBuilder(
                        future: _firebaseServices
                            .getFollowRequestsNames(docs["followers"][index]),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          return Container(
                            margin: context.verticalPaddingLow,
                            padding: context.horizontalPaddingNormal,
                            height: context.dynamicHeight(0.1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: context.dynamicWidth(0.48),
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: snapshot.data.toString(),
                                          style: context.textTheme.headline6!
                                              .copyWith(color: Colors.white),
                                        ),
                                        TextSpan(
                                          text: " sizi takip etmeye ba??lad??",
                                          style: context.textTheme.bodyText2
                                              ?.copyWith(
                                            color: Colors.white70,
                                            fontSize:
                                                context.dynamicWidth(0.05),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    fixedSize: MaterialStateProperty.all(
                                      Size(context.width * 0.32,
                                          context.height * .03),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                      const Color(0xFFACA0DF),
                                    ),
                                  ),
                                  child: Text(
                                    "GT",
                                    style:
                                        context.textTheme.bodyText2?.copyWith(
                                      color: Colors.white,
                                      fontSize: context.dynamicWidth(0.05),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFF7860E1),
                                width: 1,
                              ),
                              borderRadius: context.normalBorderRadius,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: context.horizontalPaddingNormal,
                    itemCount: docs["followRequests"].length,
                    itemBuilder: (BuildContext context, int index) {
                      return FutureBuilder(
                        future: _firebaseServices.getFollowRequestsNames(
                            docs["followRequests"][index]),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          return Container(
                            margin: context.verticalPaddingLow,
                            padding: context.horizontalPaddingNormal,
                            height: context.dynamicHeight(0.1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: context.dynamicWidth(0.48),
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: snapshot.data.toString(),
                                          style: context.textTheme.headline6!
                                              .copyWith(color: Colors.white),
                                        ),
                                        TextSpan(
                                          text: " size takip iste??i g??nderdi.",
                                          style: context.textTheme.bodyText2
                                              ?.copyWith(
                                            color: Colors.white70,
                                            fontSize:
                                                context.dynamicWidth(0.05),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    _firebaseServices.acceptFollowRequest(
                                        docs["followRequests"][index]);
                                  },
                                  style: ButtonStyle(
                                    fixedSize: MaterialStateProperty.all(
                                      Size(context.width * 0.32,
                                          context.height * .03),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                      const Color(0xFFACA0DF),
                                    ),
                                  ),
                                  child: Text(
                                    "Kabul Et",
                                    style:
                                        context.textTheme.bodyText2?.copyWith(
                                      color: Colors.white,
                                      fontSize: context.dynamicWidth(0.05),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFF7860E1),
                                width: 1,
                              ),
                              borderRadius: context.normalBorderRadius,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          }
          return const CenteredProgressIndicator();
        },
      ),
    );
  }
}
