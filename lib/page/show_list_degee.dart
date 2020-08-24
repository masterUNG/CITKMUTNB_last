import 'dart:convert';

import 'package:citkmutnb/page/mycontent.dart';
import 'package:citkmutnb/page/show_pdf.dart';
import 'package:citkmutnb/utility/my_constant.dart';
import 'package:citkmutnb/utility/my_style.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ShowListDegee extends StatefulWidget {
  final int degeeAInt;
  ShowListDegee({Key key, this.degeeAInt}) : super(key: key);
  @override
  _ShowListDegeeState createState() => _ShowListDegeeState();
}

class _ShowListDegeeState extends State<ShowListDegee> {
  List<String> listTitles = ['ปริญญาเอก', 'ปริญญาโท', 'ปริญญาตรี'];
  List<String> listdegree = ['ป.เอก', 'ป.โท', 'ป.ตรี'];
  List<String> department = List();
  List<List<Widget>> listFileNameWidget = List();
  int index;

  List<String> departments = List();

  @override
  void initState() {
    super.initState();
    index = widget.degeeAInt;
    redaData();
  }

  Future<Null> redaData() async {
    try {
      String url =
          '${MyConstant().domain}/cit/getDegreeWhereDegree.php?isAdd=true&degree=${listdegree[index]}';
      Response response = await Dio().get(url);
      print('respone = $response');

      if (response.toString() != 'null') {
        var result = json.decode(response.data);
        // print('resilt = $result');
        for (var json in result) {
          String string = json['department'];

          List<Widget> widgets = await createSetFileName(string);

          setState(() {
            if (checkDepartment(string)) {
              departments.add(string);
              listFileNameWidget.add(widgets);
            }
          });
        }
      }
    } catch (e) {
      print('e = ${e.toString()}');
    }
  }

  bool checkDepartment(String string) {
    bool result = true;

    if (departments.length != 0) {
      for (var department in departments) {
        if (string == department) {
          result = false;
        }
      }
    } //if1

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(index == null ? '' : listTitles[index]),
      ),
      body: departments.length == 0
          ? Mystyle().showProgress()
          : ListView.builder(
              itemCount: departments.length,
              itemBuilder: (context, index) => showcontant(index),
            ),
    );
  }

  Widget showcontant(int index) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 7.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(15.0),
              color: Colors.orange,
            ),
            width: 320.0,
            child: Column(
              children: <Widget>[
                ExpansionTile(
                  title: Text(
                    departments[index],
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: listFileNameWidget[index],
                ),
              ],
            ),
          ),
        ],
      );

  Widget showExpand() {
    return Text('File Name');
  }

  Future<List<Widget>> createSetFileName(String string) async {
    List<Widget> fileNamesWidget = List();
    String url =
        '${MyConstant().domain}/cit/getDegreeWhereDepartment.php?isAdd=true&degree=${listdegree[index]}&department=$string';
    Response response = await Dio().get(url);
    // print('res = $response');
    var result = json.decode(response.data);
    for (var map in result) {
      String string = map['file_name'];
      Widget text = ListTile(
        onTap: () {
          print('You click == $string');
          MaterialPageRoute route = MaterialPageRoute(
            builder: (context) => ShowPdf(namePDF: string,catigory: 'file_degree',),
          );
          Navigator.push(context, route);
        },
        leading: Icon(
          Icons.library_books,
          color: Colors.white,
        ),
        title: Text(
          string,
          style: TextStyle(color: Colors.white),
        ),
      );
      fileNamesWidget.add(text);
      // print(string);

    }
    return fileNamesWidget;
  }
}
