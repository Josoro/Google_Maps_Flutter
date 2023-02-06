import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapGoogleSample extends StatefulWidget {
  const MapGoogleSample({Key? key}) : super(key: key);

  @override
  State<MapGoogleSample> createState() => MapGoogleSampleState();
}

class MapGoogleSampleState extends State<MapGoogleSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

//cameraPosition
  static const CameraPosition cameraPosition = CameraPosition(
    target: LatLng(10.456171, -84.598114),
    zoom: 14.4746,
  );

  static const CameraPosition position = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(10.456171, -84.598114),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.satellite,
        initialCameraPosition: cameraPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.indigo,
        onPressed: _goToTheLake,
        label: const Text('My Position!'),
        icon: const Icon(Icons.maps_home_work_sharp),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(position));
  }
}
