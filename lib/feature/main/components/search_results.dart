import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/components/centered_progress.dart';
import '../../../core/models/event_model.dart';
import '../../../core/routes/route_constants.dart';
import '../../../core/services/firebase_services.dart';
import '../viewmodel/main_viewmodel.dart';
import 'search_card.dart';

class SearchResult extends StatelessWidget {
  SearchResult({
    Key? key,
    required this.mainVM,
  }) : super(key: key);
  final FirebaseServices _firebaseServices = FirebaseServices();
  final MainVM mainVM;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firebaseServices.getEvents(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Text('Error = ${snapshot.error}');
        }
        if (snapshot.hasData) {
          final docs = snapshot.data.docs;
          return SizedBox(
            height: context.height * 0.6,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: docs.length,
                itemBuilder: (BuildContext context, int index) {
                  final doc = docs[index];
                  if (doc["title"]
                      .toString()
                      .toLowerCase()
                      .contains(mainVM.searchValue.toLowerCase())) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Routes.eventDetail,
                          arguments: Event.fromJson(doc.data()),
                        );
                      },
                      child: SearchCard(doc: doc),
                    );
                  }
                  return const SizedBox();
                }),
          );
        }
        return const CenteredProgressIndicator();
      },
    );
  }
}
