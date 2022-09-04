import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/components/centered_progress.dart';
import '../../../core/services/firebase_services.dart';

class AppBarProfileImage extends StatelessWidget {
  const AppBarProfileImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseServices.user
          .doc(FirebaseAuth.instance.currentUser!.email)
          .snapshots(),
      builder: (context, AsyncSnapshot snapshot) {
        var output = snapshot.data;
        if (snapshot.data == null) {
          return const CenteredProgressIndicator();
        } else if (!snapshot.hasData) {
          return const CenteredProgressIndicator();
        }
        return output["profileImageUrl"] == null
            ? IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.person_rounded,
                  size: 30.sp,
                  color: Colors.white,
                ),
              )
            : CircleAvatar(
                radius: 20.r,
                backgroundColor: AppColors.transparent,
                backgroundImage: NetworkImage(
                  output["profileImageUrl"],
                ),
              );
      },
    );
  }
}
