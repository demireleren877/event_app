import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
part 'map_viewmodel.g.dart';

class MapVM = _MapVMBase with _$MapVM;

abstract class _MapVMBase with Store {
  @observable
  final ObservableMap<String, Marker> markers = ObservableMap.of({});

  @action
  getLocations(context, CustomInfoWindowController controller) async {
    FirebaseFirestore.instance.collection("locations").get().then((value) {
      for (var element in value.docs) {
        var marker = Marker(
            markerId: MarkerId(element["name"]),
            position: LatLng(element["lat"], element["lon"]),
            onTap: () {
              controller.addInfoWindow!(
                  Container(
                    height: 300.w,
                    width: 200.h,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 8, 78, 112)
                            .withOpacity(.85),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 120.h,
                              width: 300.w,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(element["image"]),
                                    fit: BoxFit.fitWidth),
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10.r),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                width: 300.w,
                                height: 40.h,
                                color: Colors.black38,
                              ),
                            ),
                            Positioned(
                              left: 3,
                              bottom: 3,
                              child: Text(
                                element["name"],
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            element["address"],
                            style: TextStyle(
                              fontSize: 15.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  LatLng(element["lat"], element["lon"]));
            });
        markers[element["name"]] = marker;
      }
    });
  }
}
