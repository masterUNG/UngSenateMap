import 'package:flutter/material.dart';
import 'package:ungsenatemap/screens/alert_serveic_loactoion.dart';
import 'package:ungsenatemap/screens/home.dart';
import 'package:ungsenatemap/screens/main_hold.dart';
import 'package:ungsenatemap/screens/main_room.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/home':(BuildContext context)=>Home(),
  '/mainHold':(BuildContext context)=>MainHold(),
  '/alertService':(BuildContext context)=>AlertServiceLocation(),
  '/mainRoom':(BuildContext context)=>MainRoom(),
  '/home2':(BuildContext context)=>Home(latUser: 13.751611324659248,lngUser: 100.49272219144834,)
};