import 'package:flutter/material.dart';
import 'package:ungsenatemap/screens/history.dart';
import 'package:ungsenatemap/screens/symbol.dart';

class MainHold extends StatefulWidget {
  @override
  _MainHoldState createState() => _MainHoldState();
}

class _MainHoldState extends State<MainHold> {
  List<String> nameIcons = [
    'icon1.png',
    'icon2.png',
    'icon3.png',
    'icon4.png',
    'icon5.png',
    'icon6.png',
    'icon7.png',
    'icon8.png'
  ];

  List<String> titles = [
    'ประวัติรัฐสภา',
    'ตราสัญญาลักษณ์',
    'วัสถาปนารัญสภา',
    'สถานที่สำคัญ',
    'อาคารในรัฐสภา',
    'สถานที่ใกล้เคียง',
    'การเดินทาง',
    'ช่องทางการติดต่อ'
  ];

  List<Widget> widgets = List();

  List<Widget> routToWidgdets = [
    History(),
    Symbol(),
    History(),
    Symbol(),
    History(),
    Symbol(),
    History(),
    Symbol()
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('แนะนำ รัฐสภา'),
      ),
      body: GridView.extent(
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        maxCrossAxisExtent: 300,
        children: widgets,
      ),
    );
  }
}
