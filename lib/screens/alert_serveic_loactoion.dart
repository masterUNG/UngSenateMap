import 'dart:io';

import 'package:flutter/material.dart';

class AlertServiceLocation extends StatefulWidget {
  @override
  _AlertServiceLocationState createState() => _AlertServiceLocationState();
}

class _AlertServiceLocationState extends State<AlertServiceLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: ()=>exit(0),
            child: Text('Please Enable Location Service at Setting')),
      ),
    );
  }
}
