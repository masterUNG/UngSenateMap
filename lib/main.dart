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

// main() {
//   initRoute = '/home';
//   runApp(MyApp());
// }

Future<Null> findPosition() async {
  bool locationServiceEnable;
  LocationPermission permission;

  locationServiceEnable = await Geolocator.isLocationServiceEnabled();

  if (!locationServiceEnable) {
    initRoute = '/alertService';
    runApp(MyApp());
  } else {
    permission = await Geolocator.checkPermission();
    print('##################################################');
    print('########## permission ==>> $permission ###########');
    print('##################################################');

    if (permission == LocationPermission.deniedForever) {
      initRoute = '/mainHold';
      runApp(MyApp());
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      print('##################################################');
      print('########## permission from denied ==>> $permission');
      print('##################################################');

      if ((permission != LocationPermission.always) &&
          (permission != LocationPermission.whileInUse)) {
        print('In condition');
        initRoute = '/mainHold';
        runApp(MyApp());
      } else {
        print('Out condition');
        initRoute = '/home';
        runApp(MyApp());
      }
    } 

    if (permission == LocationPermission.whileInUse) {
      initRoute = '/home';
        runApp(MyApp());
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
