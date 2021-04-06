import 'package:flutter/material.dart';

class ShowRoom360 extends StatefulWidget {
  final String image, title;
  ShowRoom360({@required this.image, @required this.title});
  @override
  _ShowRoom360State createState() => _ShowRoom360State();
}

class _ShowRoom360State extends State<ShowRoom360> {
  String image, title;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    image = widget.image;
    title = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title),),
    );
  }
}
