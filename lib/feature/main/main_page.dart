import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_app/core/components/centered_progress.dart';
import 'package:event_app/feature/home/components/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';
import '../../core/cache/cache_manager.dart';
import '../../core/services/firebase_services.dart';
import '../../core/utilities/scroll_behavior.dart';
import 'components/party_slider.dart';
import 'components/search_field.dart';
import 'components/search_results.dart';
import 'components/welcome_text.dart';
import 'viewmodel/main_viewmodel.dart';

class MainScreen extends StatelessWidget {
  MainScreen({
    Key? key,
  }) : super(key: key);
  final CacheManager _cacheManager = CacheManager();
  final FirebaseServices _firebaseServices = FirebaseServices();
  final MainVM _mainVM = MainVM();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: buildHomeAppBar(context),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: _firebaseServices.getEvents(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error = ${snapshot.error}');
            }
            if (snapshot.hasData) {
              final docs = snapshot.data!.docs;
              return ScrollConfiguration(
                behavior: MyBehavior(),
                child: Observer(builder: (a) {
                  return ListView(
                    padding: context.paddingLow,
                    children: [
                      WelcomeText(cacheManager: _cacheManager),
                      context.emptySizedHeightBoxLow3x,
                      SearchField(mainVM: _mainVM),
                      context.emptySizedHeightBoxLow3x,
                      _mainVM.searchValue.isNotEmpty
                          ? SearchResult(mainVM: _mainVM)
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: context.horizontalPaddingNormal,
                                  child: Text(
                                    "FEATURED",
                                    style:
                                        context.textTheme.bodyText2?.copyWith(
                                      color: Colors.white,
                                      fontSize: context.width * 0.04,
                                    ),
                                  ),
                                ),
                                context.emptySizedHeightBoxLow3x,
                                PartySlider(docs: docs),
                                context.emptySizedHeightBoxLow3x,
                                Padding(
                                  padding: context.horizontalPaddingNormal,
                                  child: Text(
                                    "FOR YOU",
                                    style:
                                        context.textTheme.bodyText2?.copyWith(
                                      color: Colors.white,
                                      fontSize: context.width * 0.04,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: context.height * 0.25,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/paket.png"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ],
                  );
                }),
              );
            }
            return const CenteredProgressIndicator();
          }),
    );
  }
}
