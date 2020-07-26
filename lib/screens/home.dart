import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double lat, lng;
  LatLng startLatLng;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    findLatLng();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: lat == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : buildGoogleMap(),
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
      markers: <Marker>[
        Marker(
          markerId: MarkerId('idUser'),
          position: startLatLng,
        ),
      ].toSet(),
    );
  }

  Future<Null> findLatLng() async {
    LocationData data = await findLocationData();
    if (data != null) {
      setState(() {
        lat = data.latitude;
        lng = data.longitude;
        print('lat = $lat, lng = $lng');
        startLatLng = LatLng(lat, lng);
      });
    }
  }

  Future<LocationData> findLocationData() async {
    Location location = Location();
    try {
      return location.getLocation();
    } catch (e) {
      return null;
    }
  }
}
