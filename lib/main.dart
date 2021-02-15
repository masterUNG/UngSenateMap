import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';

import 'package:ungsenatemap/router.dart';


var initRoute;
bool status = true;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  findPosition();
}

Future<Null> findPosition() async {
  bool locationServiceEnable;
  LocationPermission permission;

  locationServiceEnable = await Geolocator.isLocationServiceEnabled();

  if (!locationServiceEnable) {
    initRoute = '/alertService';
    runApp(MyApp());
  } else {
    permission = await Geolocator.checkPermission();
    print('########## permission ==>> $permission');
    if (permission == LocationPermission.deniedForever) {
      initRoute = '/mainHold';
      runApp(MyApp());
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      print('########## permission from denied ==>> $permission');

      if ((permission != LocationPermission.always) &&
          (permission != LocationPermission.whileInUse)) {
        initRoute = '/mainHold';
        runApp(MyApp());
      } else {
        initRoute = '/home';
        runApp(MyApp());
      }
    }
  }
}

Future<Null> findLatLng() async {
  try {
    LocationData data = await findLocation();
  } catch (e) {}
}

Future<LocationData> findLocation() async {
  Location location = Location();
  try {
    return location.getLocation();
  } catch (e) {
    return null;
  }
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Senate Map',
      theme: ThemeData(primarySwatch: Colors.purple),
      routes: routes,
      initialRoute: initRoute,
    );
  }
}
