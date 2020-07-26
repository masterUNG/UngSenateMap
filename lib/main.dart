import 'package:flutter/material.dart';
import 'package:ungsenatemap/screens/home.dart';


main()=>runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Senate Map',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: Home(),
    );
  }
}