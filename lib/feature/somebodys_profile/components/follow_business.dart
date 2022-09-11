import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';

import '../../../core/components/centered_progress.dart';
import '../../../core/models/user_model.dart';
import '../../../core/services/firebase_services.dart';
import '../../sign_up/components/signup_button.dart';

class FollowersAndFollowing extends StatefulWidget {
  const FollowersAndFollowing(
      {Key? key,
      required this.firebaseServices,
      required this.user,
      required this.isFollowed})
      : super(key: key);

  final FirebaseServices firebaseServices;
  final User user;
  final bool isFollowed;

  @override
  State<FollowersAndFollowing> createState() => _FollowersAndFollowingState();
}

class _FollowersAndFollowingState extends State<FollowersAndFollowing> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseServices.user.doc(widget.user.email).snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final docs = snapshot.data;
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        docs["followers"].length.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                        ),
                      ),
                      Text(
                        "Takipçi",
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                  context.emptySizedWidthBoxLow,
                  Column(
                    children: [
                      Text(
                        docs["following"].length.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                        ),
                      ),
                      Text(
                        "Takip Edilen",
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              context.emptySizedHeightBoxLow3x,
              SignUpButton(
                buttonColor: const Color(0xFF7860E1),
                textColor: Colors.white,
                text: docs["followRequests"]
                        .contains(FirebaseServices.auth.currentUser!.email)
                    ? "Beklemede"
                    : docs["followers"]
                            .contains(FirebaseServices.auth.currentUser!.email)
                        ? "Takipten Çık"
                        : "Takip Et",
                onPressed: () {
                  docs["followRequests"]
                          .contains(FirebaseServices.auth.currentUser!.email)
                      ? widget.firebaseServices
                          .unSendFollowRequest(widget.user.email)
                      : docs["followers"].contains(
                              FirebaseServices.auth.currentUser!.email)
                          ? widget.firebaseServices
                              .unfollowUser(widget.user.email)
                          : docs["status"] == "available"
                              ? widget.firebaseServices
                                  .followUser(widget.user.email)
                              : widget.firebaseServices
                                  .sendFollowRequest(widget.user.email);
                },
              )
            ],
          );
        }
        return const CenteredProgressIndicator();
      },
    );
  }
}
