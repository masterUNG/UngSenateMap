import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  PDFDocument pdfDocument;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readPDF();
  }

  Future<Null> readPDF() async {
    try {
      var object = await PDFDocument.fromAsset('assets/history.pdf');
      setState(() {
        pdfDocument = object;
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ประวัติรัฐสภา'),
      ),
      body: pdfDocument == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : PDFViewer(document: pdfDocument,showNavigation: false,),
    );
  }
}
