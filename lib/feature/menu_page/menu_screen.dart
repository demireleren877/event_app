import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_app/core/services/firebase_services.dart';
import 'package:event_app/feature/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../core/colors/app_colors.dart';
import '../../core/components/centered_progress.dart';
import 'data.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: StreamBuilder(
        stream: FirebaseServices.user
            .doc(FirebaseServices.auth.currentUser!.email)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) return Text('Error = ${snapshot.error}');
          if (snapshot.hasData) {
            var output = snapshot.data;
            return ListView(
              children: [
                Padding(
                  padding: context.paddingNormal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 50.r,
                        backgroundColor: AppColors.transparent,
                        backgroundImage: output["profileImageUrl"] == ""
                            ? const AssetImage("assets/image.png")
                                as ImageProvider
                            : CachedNetworkImageProvider(
                                output["profileImageUrl"],
                              ),
                      ),
                      context.emptySizedWidthBoxNormal,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            output["name"],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                            ),
                          ),
                          Text(
                            "@" + output["userName"],
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 16.sp,
                            ),
                          ),
                          Text(
                            output["email"],
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                context.emptySizedHeightBoxLow,
                const Divider(
                  thickness: 2,
                  color: Color(0xFFACA0DF),
                ),
                SizedBox(
                  height: context.height * 0.7,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: context.paddingNormal,
                    itemCount: MenuData.menuItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        onTap: () {
                          if (MenuData.menuItems[index]["title"] ==
                              "Oturumu Kapat") {
                            FirebaseServices.auth.signOut().then((value) => {
                                  PersistentNavBarNavigator.pushNewScreen(
                                      context,
                                      withNavBar: false,
                                      screen: LoginScreen())
                                });
                          }
                          if (MenuData.menuItems[index]["title"] ==
                              "Profilim") {
                            Navigator.pop(context);
                          }
                          MenuData.menuItems[index]["function"]();
                        },
                        leading: MenuData.menuItems[index]["icon"],
                        title: Text(
                          MenuData.menuItems[index]["title"],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                          ),
                        ),
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
