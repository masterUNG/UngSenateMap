import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  LatLng startLatLng = LatLng(13.797260, 100.521430);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: buildGoogleMap(),
    );
  }

  GoogleMap buildGoogleMap() {
    CameraPosition position = CameraPosition(
      target: startLatLng,
      zoom: 16,
    );

    return GoogleMap(
      initialCameraPosition: position,
      onMapCreated: (controller) {},
    );
  }
}
