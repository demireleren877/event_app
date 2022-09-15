import 'package:event_app/core/components/centered_progress.dart';
import 'package:event_app/core/models/user_model.dart';
import 'package:event_app/core/services/firebase_services.dart';
import 'package:event_app/feature/search/viewmodel/search_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../somebodys_profile/sb_profile.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
  final SearchVM _searchVM = SearchVM();
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
            backgroundColor: Colors.black,
            body: ListView(
              children: [
                context.emptySizedHeightBoxNormal,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: context.width * 0.7,
                      child: TextField(
                        controller: _searchController,
                        onChanged: (value) =>
                            _searchVM.changeSearchValue(value),
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 30.sp,
                          ),
                          hintText: "Arama yap",
                          hintStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          contentPadding: context.paddingLow,
                          filled: true,
                          fillColor: const Color(0xFFACA0DF),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.circular(context.normalValue),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _searchController.clear();
                        _searchVM.changeSearchValue("");
                      },
                      child: Text(
                        "İptal",
                        style: context.textTheme.bodyText2?.copyWith(
                          color: Colors.white,
                          fontSize: 15.sp,
                        ),
                      ),
                    )
                  ],
                ),
                context.emptySizedHeightBoxLow3x,
                TabBar(
                  padding: context.paddingNormal,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.amber,
                  indicator: BoxDecoration(
                    borderRadius: context.lowBorderRadius,
                    border: Border.all(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                  unselectedLabelStyle:
                      context.textTheme.headline6?.copyWith(fontSize: 18.sp),
                  labelStyle:
                      context.textTheme.headline6?.copyWith(fontSize: 18.sp),
                  tabs: const [
                    Tab(
                      text: "Kişiler",
                    ),
                    Tab(
                      text: "Mekanlar",
                    ),
                  ],
                ),
                Observer(builder: (_) {
                  return SizedBox(
                    height: context.height * 0.65,
                    child: TabBarView(
                      children: [
                        _searchVM.searchValue.isEmpty
                            ? Container()
                            : StreamBuilder(
                                stream: FirebaseServices.user.snapshots(),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.hasError) {
                                    return Center(
                                      child: Text("Error: ${snapshot.error}"),
                                    );
                                  }
                                  if (snapshot.hasData) {
                                    final docs = snapshot.data.docs;
                                    return Container(
                                      color: Colors.black,
                                      height: context.height * 0.75,
                                      child: ListView.builder(
                                        itemCount: docs.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final doc = docs[index];
                                          if ((doc["userName"]
                                                      .toString()
                                                      .toLowerCase()
                                                      .contains(_searchVM
                                                          .searchValue
                                                          .toLowerCase()) ||
                                                  doc["name"]
                                                      .toString()
                                                      .toLowerCase()
                                                      .contains(_searchVM
                                                          .searchValue
                                                          .toLowerCase())) &&
                                              doc["email"] !=
                                                  FirebaseServices.auth
                                                      .currentUser!.email) {
                                            return ListTile(
                                              onTap: () {
                                                pushNewScreen(
                                                  context,
                                                  screen: SomeBodysProfile(
                                                    user: User.fromJson(
                                                      doc.data(),
                                                    ),
                                                  ),
                                                );
                                              },
                                              leading: CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    doc["profileImageUrl"]),
                                              ),
                                              title: Text(doc["name"]),
                                              subtitle:
                                                  Text("@" + doc["userName"]),
                                            );
                                          } else {
                                            return Container();
                                          }
                                        },
                                      ),
                                    );
                                  }
                                  return const CenteredProgressIndicator();
                                },
                              ),
                        Container(
                          color: Colors.black,
                        ),
                      ],
                    ),
                  );
                }),
              ],
            )));
  }
}
// html daha ii en iyi dil