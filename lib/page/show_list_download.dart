import 'dart:convert';

import 'package:citkmutnb/page/show_pdf.dart';
import 'package:citkmutnb/utility/my_constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ShowiistDownload extends StatefulWidget {
  @override
  _ShowiistDownloadState createState() => _ShowiistDownloadState();
}

class _ShowiistDownloadState extends State<ShowiistDownload> {
  List<String> fileNames = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readAllDownload();
  }

  Future<Null> readAllDownload() async {
    String url = '${MyConstant().domain}/cit/getAllDownload.php';
    Response response = await Dio().get(url);
    var result = json.decode(response.data);
    for (var map in result) {
      setState(() {
        fileNames.add(map['file_name']);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ดาวน์โหลด'),
        ),
        body: fileNames.length == 0
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: fileNames.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    MaterialPageRoute route = MaterialPageRoute(
                      builder: (context) => ShowPdf(
                        namePDF: fileNames[index],catigory: 'file_download',
                      ),
                    );
                    Navigator.push(context, route);
                  },
                  child: Card(
                    child: Container(
                      margin: EdgeInsets.all(16.0),
                      child: Text(fileNames[index]),
                    ),
                  ),
                ),
              ));
  }
}
