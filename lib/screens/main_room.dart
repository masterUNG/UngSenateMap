import 'package:flutter/material.dart';
import 'package:ungsenatemap/screens/show_room360.dart';

class MainRoom extends StatefulWidget {
  @override
  _MainRoomState createState() => _MainRoomState();
}

class _MainRoomState extends State<MainRoom> {
  List<String> images = ['images/test1.jpg'];
  List<String> titles = ['ห้องทดสอบ'];
  List<Widget> widgets = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createListWidgets();
  }

  void createListWidgets() {
    int index = 0;
    for (var item in images) {
      Widget widget = GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShowRoom360(
              image: images[index],
              title: titles[index],
            ),
          ),
        ),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 100,
                height: 100,
                child: Image.asset(
                  item,
                  fit: BoxFit.cover,
                ),
              ),
              Text(titles[index]),
            ],
          ),
        ),
      );
      setState(() {
        widgets.add(widget);
      });
      index++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ห้องที่ แสดง 360 องศา'),
      ),
      body: widgets.length == 0
          ? Center(child: CircularProgressIndicator())
          : buildGridView(),
    );
  }

  Widget buildGridView() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.extent(
        maxCrossAxisExtent: 160,
        children: widgets,
      ),
    );
  }
}
