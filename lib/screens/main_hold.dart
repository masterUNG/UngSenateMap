import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ungsenatemap/screens/history.dart';
import 'package:ungsenatemap/screens/symbol.dart';
import 'package:ungsenatemap/utility/normal_dialog.dart';

class MainHold extends StatefulWidget {
  @override
  _MainHoldState createState() => _MainHoldState();
}

class _MainHoldState extends State<MainHold> {
  List<String> nameIcons = [
    'icon1.png',
    // 'icon2.png',
    // 'icon3.png',
    // 'icon4.png',
    // 'icon5.png',
    // 'icon6.png',
    // 'icon7.png',
    // 'icon8.png'
  ];

  List<String> titles = [
    'ประวัติรัฐสภา',
    // 'ตราสัญญาลักษณ์',
    // 'วัสถาปนารัญสภา',
    // 'สถานที่สำคัญ',
    // 'อาคารในรัฐสภา',
    // 'สถานที่ใกล้เคียง',
    // 'การเดินทาง',
    // 'ช่องทางการติดต่อ'
  ];

  List<Widget> widgets = [];

  List<Widget> routToWidgdets = [
    History(),
    // Symbol(),
    // History(),
    // Symbol(),
    // History(),
    // Symbol(),
    // History(),
    // Symbol()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    int i = 0;
    for (var title in titles) {
      Widget widget = creadCard(title, nameIcons[i], i);
      widgets.add(widget);
      i++;
    }
  }

  Widget creadCard(String title, String nameIcon, int index) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => routToWidgdets[index],
        ),
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: Colors.amber.shade200,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 100,
                child: Image.asset('images/$nameIcon'),
              ),
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Null> openSetting() async {
    await Geolocator.openLocationSettings().then((value) {
      exit(0);
    });
  }

  Future<Null> checkPermission() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();

    print('##################################################');
    print('permissoin ====>>>> $permission #####');
    print('##################################################');

    if ((permission == LocationPermission.deniedForever) ||
        (permission == LocationPermission.denied)) {
      showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Platform.isIOS
                ? Text('การเปิดการใช้งานแชร์ พิกัด สำหรับ iOS')
                : Text('การเปิดการใช้งานแชร์ พิกัด สำหรับ Android'),
            children: [
              Platform.isIOS ? buildiOS() : buildAndroid(),
              TextButton(
                  onPressed: () {
                    openSetting();
                  },
                  child: Text('OK')),
            ],
          );
        },
      );
    } else {
      normalDialog(context, 'ขออนุญาติ แชร์ พิกัดเรียบร้อย แล้วคะ');
    }
  }

  Widget buildAndroid() => Column(
        children: [
          Text(
            'Click App permission',
            style: TextStyle(
              color: Colors.blue.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            width: 200,
            child: Image.asset('images/android1.png'),
          ),
          Text(
            'เลื่อนลงมา',
            style: TextStyle(
              color: Colors.blue.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            width: 200,
            child: Image.asset('images/android2.png'),
          ),
          Text(
            'มองหา แอพของเรา คลิก',
            style: TextStyle(
              color: Colors.blue.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            width: 200,
            child: Image.asset('images/android3.png'),
          ),
          Text(
            'กำหนด permission เป็น Allow only shile user the app',
            style: TextStyle(
              color: Colors.blue.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            width: 200,
            child: Image.asset('images/android4.png'),
          ),
          Text(
            'App เราจะปิดลงไป ให้เปิดแอพมาใหม่',
            style: TextStyle(
              color: Colors.blue.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            width: 200,
            child: Image.asset('images/android5.png'),
          ),
          Text(
            'แอพจะเข้าถึง Service Location ได้แบบนีี้',
            style: TextStyle(
              color: Colors.blue.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            width: 200,
            child: Image.asset('images/android5.png'),
          ),
        ],
      );

  Widget buildiOS() => Column(
        children: [
          Text(
            'Click App permission',
            style: TextStyle(
              color: Colors.blue.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            width: 200,
            child: Image.asset('images/ios1.png'),
          ),
          Text(
            'เลื่อนลงมา',
            style: TextStyle(
              color: Colors.blue.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            width: 200,
            child: Image.asset('images/ios2.png'),
          ),
          Text(
            'มองหา แอพของเรา คลิก',
            style: TextStyle(
              color: Colors.blue.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            width: 200,
            child: Image.asset('images/ios3.png'),
          ),
          Text(
            'กำหนด permission เป็น Allow only shile user the app',
            style: TextStyle(
              color: Colors.blue.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            width: 200,
            child: Image.asset('images/ios4.png'),
          ),
          Text(
            'App เราจะปิดลงไป ให้เปิดแอพมาใหม่',
            style: TextStyle(
              color: Colors.blue.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            width: 200,
            child: Image.asset('images/ios5.png'),
          ),
          Text(
            'แอพจะเข้าถึง Service Location ได้แบบนีี้',
            style: TextStyle(
              color: Colors.blue.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            width: 200,
            child: Image.asset('images/ios6.png'),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            width: 200,
            child: Image.asset('images/ios7.png'),
          ),
        ],
      ); // end

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('แนะนำ รัฐสภา'),
        actions: [
          buildChangePermission(),
        ],
      ),
      body: GridView.extent(
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        maxCrossAxisExtent: 300,
        children: widgets,
      ),
    );
  }

  IconButton buildChangePermission() {
    return IconButton(
      icon: Icon(Icons.location_on),
      onPressed: () => checkPermission(),
    );
  }
}
