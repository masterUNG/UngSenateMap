import 'dart:async';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ungsenatemap/router.dart';

var initRoute;
bool status = true;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  findLatLng();
  checkPermissLocation();
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

Future<Null> checkPermissLocation() async {
  print('checkPermission Work');
  // LocationData data = await findLocation();

  Duration duration = Duration(seconds: 10);
  await Timer(duration, () async {
    print('work after 10sec');
    await Permission.location.status.then((value) async {
      if (value.isGranted) {
        print('##### Persion Status Granted   #######');
        initRoute = '/home';
      } else if (value.isRestricted) {
        print('##### Persion Status Restricted #######');
        initRoute = '/mainHold';
      } else {
        print('##### Persion Status Non Granted #######');

        initRoute = '/mainHold';
      }

      runApp(MyApp());
    });
  });
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
