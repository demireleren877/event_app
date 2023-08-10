import 'package:custom_info_window/custom_info_window.dart';
import 'package:event_app/feature/map/viewmodel/map_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kartal/kartal.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();
  String maptheme = "";
  final MapVM _mapVM = MapVM();

  @override
  void initState() {
    _mapVM.getLocations(context, _customInfoWindowController);
    DefaultAssetBundle.of(context)
        .loadString("assets/maptheme/theme.json")
        .then((value) => maptheme = value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        body: SizedBox(
          height: context.height * 0.94,
          child: Stack(
            children: [
              GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: const CameraPosition(
                  target: LatLng(41.2, 29.1),
                  zoom: 8,
                ),
                onMapCreated: (controller) {
                  _customInfoWindowController.googleMapController = controller;
                  controller.setMapStyle(maptheme);
                },
                onCameraMove: (pos) {
                  _customInfoWindowController.onCameraMove!();
                },
                markers: _mapVM.markers.values.toSet(),
                onTap: (pos) {
                  _customInfoWindowController.hideInfoWindow!();
                },
              ),
              CustomInfoWindow(
                controller: _customInfoWindowController,
                height: 200.h,
                width: 300.w,
                offset: 35.w,
              )
            ],
          ),
        ),
      );
    });
  }
}
