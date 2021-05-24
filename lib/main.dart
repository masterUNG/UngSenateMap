import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ungsenatemap/router.dart';

var initRoute;
bool status = true;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool locationService = await Geolocator.isLocationServiceEnabled();
  if (locationService) {
    // Open Service Locaion
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      initRoute = '/home2';
      runApp(MyApp());
    } else if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        initRoute = '/home2';
        runApp(MyApp());
      } else {
        initRoute = '/home';
        runApp(MyApp());
      }
    } else {
      initRoute = '/home';
      runApp(MyApp());
    }
  } else {
    // Closs Service Location
    initRoute = '/home2';
    runApp(MyApp());
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
