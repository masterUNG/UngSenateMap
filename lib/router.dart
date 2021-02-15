import 'package:flutter/material.dart';
import 'package:ungsenatemap/screens/alert_serveic_loactoion.dart';
import 'package:ungsenatemap/screens/home.dart';
import 'package:ungsenatemap/screens/main_hold.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/home':(BuildContext context)=>Home(),
  '/mainHold':(BuildContext context)=>MainHold(),
  '/alertService':(BuildContext context)=>AlertServiceLocation(),
};