import 'package:citkmutnb/utility/my_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class ShowPdf extends StatefulWidget {
  final String namePDF;
  final String catigory;
  ShowPdf({Key key, this.namePDF, this.catigory}) : super(key: key);
  @override
  _ShowPdfState createState() => _ShowPdfState();
}

class _ShowPdfState extends State<ShowPdf> {
  String namePDF, catigory;
  PDFDocument pdfDocument;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    namePDF = widget.namePDF;
    catigory = widget.catigory;
    loadpDF();
  }


  Future<Null> loadpDF() async{
    try {

      String url = '${MyConstant().domain}/cit/$catigory/$namePDF';
      var object = await PDFDocument.fromURL(url);
      setState(() {
        pdfDocument = object;
      });
    } catch (e) {
    }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: pdfDocument == null ? Center(child: CircularProgressIndicator(),) : PDFViewer(document: pdfDocument),
    );
  }
}
