import 'dart:convert';

import 'package:citkmutnb/page/mycontent.dart';
import 'package:citkmutnb/page/show_pdf.dart';
import 'package:citkmutnb/utility/my_constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Detailpak1 extends StatefulWidget {
  final String category;
  Detailpak1({Key key, this.category}) : super(key: key);
  @override
  _Detailpak1State createState() => _Detailpak1State();
}

class _Detailpak1State extends State<Detailpak1> {
  String category;
  List<String> programs = List();
  List<List<String>> listSubTiTles = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    category = widget.category;
    readDepartment();
  }

  Future<Null> readDepartment() async {
    String url =
        '${MyConstant().domain}/cit/getDepartmentWheredepartment.php?isAdd=true&department=$category';
    Response response = await Dio().get(url);
    var result = json.decode(response.data);
    // print('result = $result');
    for (var map in result) {
      String program = map['program'];
      if (checkProgram(program)) {
        String url2 =
            '${MyConstant().domain}/cit/getDeparWhereDeparAndProgram.php?isAdd=true&department=$category&program=$program';
        Response response2 = await Dio().get(url2);
        var result2 = json.decode(response2.data);
        List<String> subTitles = List();
        for (var map in result2) {
          subTitles.add(map['file_name']);
        }

        setState(() {
          programs.add(program);
          listSubTiTles.add(subTitles);
          // print('program = $program');
        });
      }
    }
  }

  bool checkProgram(String program) {
    bool status = true;
    if (programs.length != 0) {
      for (var string in programs) {
        if (program == string) {
          status = false;
        }
      }
    }
    return status;
  }

  @override
  Widget build(BuildContext context) {
    return programs.length == 0
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: programs.length,
            itemBuilder: (context, index) => Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      programs[index],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                showListSubTitle(index),
              ],
            ),
          );
  }

  Widget showListSubTitle(int index) {
    return listSubTiTles.length == 0
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: listSubTiTles[index].length,
            itemBuilder: (context, index2) => ListTile(
              onTap: () {
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (context) => ShowPdf(catigory: 'file_department',namePDF: listSubTiTles[index][index2],),
                );Navigator.push(context, route);
              },
              leading: Icon(
                Icons.check_box,
                color: Colors.orange.shade700,
              ),
              title: Text(
                listSubTiTles[index][index2],
                style: TextStyle(color: Colors.orange.shade700),
              ),
            ),
          );
  }
}
