import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'package:ungsenatemap/screens/main_hold.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double lat, lng;
  double latUser, lngUser;
  Location location = Location();
  LatLng startLatLng;
  Set<Polygon> currentPolygon = Set();
  double latSenate = 13.794939, lngSenate = 100.516888;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // checkPermission();
    _createPolylines();
    choosePlatform();
    // findLatLng();
    currentPolygon = senatePolygon();
    // checkPermissLocation();
  }

  void choosePlatform() {
    if (Platform.isIOS) {
      print('############ Welcome iOS ############');
      findLatLng();
    } else if (Platform.isAndroid) {
      location.onLocationChanged.listen((event) {
        if (lat == null) {
          latUser = event.latitude;
          lngUser = event.longitude;
          print('lat,lngUser #1 ==> $latUser, $lngUser');
          setState(() {
            lat = latUser;
            lng = lngUser;
          });
        } else {
          setState(() {
            latUser = event.latitude;
            lngUser = event.longitude;
            print('lat,lngUser #2 ==> $latUser, $lngUser');
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(),
      appBar: AppBar(),
      body: lat == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : buildGoogleMap(),
    );
  }

  Drawer buildDrawer() => Drawer(
        child: Column(
          children: <Widget>[
            buildUserAccountsDrawerHeader(),
            buildListTileHome(),
            buildListTileBuildA(),
            buildListTileBuildB(),
            buildListTileBuildC(),
            buildListTileMainHold(),
          ],
        ),
      );

  ListTile buildListTileMainHold() => ListTile(
        onTap: () {
          Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MainHold(),
              ));
        },
        subtitle: Text('ประวัติความเป็นมา, ตราสัญลักษณ์, อาคารในรัฐสภา'),
        title: Text('แนะนำ รัฐสภา'),
        leading: Icon(
          Icons.list,
          size: 36,
          color: Colors.purple,
        ),
      );

  ListTile buildListTileHome() => ListTile(
        leading: Icon(
          Icons.home,
          size: 36,
          color: Colors.yellow.shade600,
        ),
        title: Text('สัปปายะสภาสถาน'),
        subtitle: Text(
            'เป็นอาคารรัฐสภาที่จะใช้แทนอาคารเดิมบริเวณข้างสวนสัตว์ดุสิต ตั้งอยู่ริมแม่น้ำเจ้าพระยา'),
        onTap: () {
          Navigator.pop(context);
          setState(() {
            currentPolygon = senatePolygon();
          });
        },
      );

  ListTile buildListTileBuildA() => ListTile(
        leading: Icon(
          Icons.looks_one,
          size: 36,
          color: Colors.blue.shade700,
        ),
        title: Text('Build A'),
        subtitle: Text('Detail Build A'),
        onTap: () {
          Navigator.pop(context);
          setState(() {
            currentPolygon = buildAPolygon();
          });
        },
      );

  ListTile buildListTileBuildB() => ListTile(
        leading: Icon(
          Icons.looks_two,
          size: 36,
          color: Colors.green.shade700,
        ),
        title: Text('Build B'),
        subtitle: Text('Detail Build B'),
        onTap: () {
          Navigator.pop(context);
          setState(() {
            currentPolygon = buildBPolygon();
          });
        },
      );

  ListTile buildListTileBuildC() => ListTile(
        leading: Icon(
          Icons.looks_3,
          size: 36,
          color: Colors.orange.shade600,
        ),
        title: Text('Build A and B'),
        subtitle: Text('Build A and B Detail'),
        onTap: () {
          Navigator.pop(context);
          setState(() {
            currentPolygon = buildCPolygon();
          });
        },
      );

  UserAccountsDrawerHeader buildUserAccountsDrawerHeader() {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/senate1.png'),
          fit: BoxFit.cover,
        ),
      ),
      accountName: null,
      accountEmail: null,
    );
  }

  Set<Polygon> senatePolygon() {
    List<LatLng> latLngs = List();
    latLngs.add(LatLng(13.797241, 100.521201));
    latLngs.add(LatLng(13.798588, 100.517215));
    latLngs.add(LatLng(13.795873, 100.515846));
    latLngs.add(LatLng(13.794545, 100.515092));
    latLngs.add(LatLng(13.793313, 100.517796));
    latLngs.add(LatLng(13.794305, 100.518561));

    Set<Polygon> polygonSet = Set();
    polygonSet.add(
      Polygon(
        polygonId: PolygonId('senateId'),
        points: latLngs,
        fillColor: Color.fromARGB(30, 255, 255, 0),
        strokeColor: Color.fromARGB(255, 204, 204, 0),
        strokeWidth: 5,
      ),
    );

    return polygonSet;
  }

  Set<Polygon> buildAPolygon() {
    List<LatLng> latLngs = List();

    latLngs.add(LatLng(13.797396, 100.518795));
    latLngs.add(LatLng(13.796364, 100.518355));
    latLngs.add(LatLng(13.796988, 100.517200));
    latLngs.add(LatLng(13.797925, 100.517772));

    Set<Polygon> polygonSet = Set();
    polygonSet.add(
      Polygon(
        polygonId: PolygonId('senateId'),
        points: latLngs,
        fillColor: Color.fromARGB(30, 0, 128, 255),
        strokeColor: Color.fromARGB(255, 0, 76, 153),
        strokeWidth: 3,
      ),
    );
    return polygonSet;
  }

  Set<Polygon> buildBPolygon() {
    List<LatLng> latLngs = List();

    latLngs.add(LatLng(13.796817, 100.517078));
    latLngs.add(LatLng(13.796239, 100.518366));
    latLngs.add(LatLng(13.795062, 100.517701));
    latLngs.add(LatLng(13.795656, 100.516327));

    Set<Polygon> polygonSet = Set();
    polygonSet.add(
      Polygon(
        polygonId: PolygonId('senateId'),
        points: latLngs,
        fillColor: Color.fromARGB(30, 0, 204, 0),
        strokeColor: Color.fromARGB(255, 0, 153, 0),
        strokeWidth: 3,
      ),
    );
    return polygonSet;
  }

  Set<Polygon> buildCPolygon() {
    List<LatLng> latLngs = List();
    latLngs.add(LatLng(13.797396, 100.518795));
    latLngs.add(LatLng(13.796364, 100.518355));
    latLngs.add(LatLng(13.796988, 100.517200));
    latLngs.add(LatLng(13.797925, 100.517772));

    List<LatLng> latLngs1 = List();
    latLngs1.add(LatLng(13.796817, 100.517078));
    latLngs1.add(LatLng(13.796239, 100.518366));
    latLngs1.add(LatLng(13.795062, 100.517701));
    latLngs1.add(LatLng(13.795656, 100.516327));

    Set<Polygon> polygonSet = Set();
    polygonSet.add(
      Polygon(
        polygonId: PolygonId('senateId0'),
        points: latLngs,
        fillColor: Color.fromARGB(30, 0, 204, 0),
        strokeColor: Color.fromARGB(255, 0, 153, 0),
        strokeWidth: 3,
      ),
    );

    polygonSet.add(
      Polygon(
        polygonId: PolygonId('senateId1'),
        points: latLngs1,
        fillColor: Color.fromARGB(30, 0, 128, 255),
        strokeColor: Color.fromARGB(255, 0, 76, 153),
        strokeWidth: 3,
      ),
    );

    return polygonSet;
  }

  // // PolylinePoints polylinePoints = PolylinePoints();
  // List<LatLng> polylineCoordinates = [];
  // Map<PolylineId, Polyline> polylines = {};

  Future<Null> _createPolylines() async {
    print('_createPolylinees Work');

    await PolylinePoints()
        .getRouteBetweenCoordinates(
          'AIzaSyC_9exOcrKygbyMKKf47-DvzAa3vhM_VFc',
          PointLatLng(13.794305, 100.518561),
          PointLatLng(13.796817, 100.517078),
          travelMode: TravelMode.transit,
        )
        .then(
          (value) => print(
              '############### Success ===>>> ${value.status.toString()}'),
        )
        .catchError((value) {
      print('#########  error   ####### ==>> ${value.toString()}');
    });
  }

  PolylinePoints userPolylinePoints;
  List<LatLng> userPolylineCoordinates = [];
  Map<PolylineId, Polyline> userPolylineId = Map();

  Future<Null> createUserPolylines(Position start, Position destination) async {
    userPolylinePoints = PolylinePoints();
    PolylineResult result = await userPolylinePoints.getRouteBetweenCoordinates(
      'AIzaSyDiKaAMHaZruKDVBkfacl5H2lX3SdKGCLA',
      PointLatLng(start.latitude, start.longitude),
      PointLatLng(destination.latitude, destination.longitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      for (var item in result.points) {
       
      }
    }



  }

  GoogleMap buildGoogleMap() {
    CameraPosition position = CameraPosition(
      // target: LatLng(lat, lng),
      target: LatLng(latSenate, lngSenate),
      zoom: 16,
    );

    return GoogleMap(
      initialCameraPosition: position,
      onMapCreated: (controller) {},
      polygons: currentPolygon,
      // polylines: Set<Polyline>.of(polylines.values),
      markers: <Marker>[
        Marker(
          markerId: MarkerId('idUser'),
          position: LatLng(latUser, lngUser),
          infoWindow: InfoWindow(title: 'คุณอยู่ที่นี่'),
        ),
        Marker(
          markerId: MarkerId('idSenate'),
          position: LatLng(latSenate, lngSenate),
          infoWindow: InfoWindow(
            title: 'สัปปายะสภาสถาน',
          ),
        ),
      ].toSet(),
    );
  }

  Future<Null> findLatLng() async {
    print('######## findLatLng Work ########');
    LocationData data = await findLocationData();
    if (data != null) {
      print('######## Location Not null ########');
      setState(() {
        lat = data.latitude;
        lng = data.longitude;
        latUser = lat;
        lngUser = lng;
        print('lat = $lat, lng = $lng');
        // startLatLng = LatLng(lat, lng);
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
