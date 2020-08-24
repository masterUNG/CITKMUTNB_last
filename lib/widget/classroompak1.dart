import 'dart:convert';

import 'package:citkmutnb/page/show_picture.dart';
import 'package:citkmutnb/utility/my_constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClassRoomPak1 extends StatefulWidget {
  final String category;
  ClassRoomPak1({Key key, this.category}) : super(key: key);
  @override
  _ClassRoomPak1State createState() => _ClassRoomPak1State();
}

class _ClassRoomPak1State extends State<ClassRoomPak1> {
  String category;
  bool status = true;
  List<String> branchs = List();
  List<List<String>> listRooms = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    category = widget.category;

    // readRoom();

    if (category == 'อิเล็กทรอนิกส์') {
      setState(() {
        status = false;
        readRoom();
      });
    }
  }

  Future<Null> readRoom() async {
    List<String> urls = MyConstant().urlAPIroom;
    List<String> categorys = MyConstant().categorys;
    int index = 0;
    for (var string in categorys) {
      if (category == string) {
        String url = '${MyConstant().domain}${urls[index]}';
        // print('url = $url');

        Response response = await Dio().get(url);
        var result = json.decode(response.data);
        for (var map in result) {
          String branch = map['branch'];

          if (checkDulicate(branch, branchs)) {
            String url2 =
                '${MyConstant().domain}/cit/getRoomenetWhereBranch.php?isAdd=true&branch=$branch';
            await Dio().get(url2).then((value) {
              var result2 = json.decode(value.data);
              List<String> rooms = List();
              for (var map in result2) {
                String room = map['room'];
                if (checkDulicate(room, rooms)) {
                  rooms.add(room);
                }
              }
              setState(() {
                listRooms.add(rooms);
              });
            });

            setState(() {
              branchs.add(branch);
            });
          }
        }
      }
      index++;
    }
  }

  bool checkDulicate(String string, List<String> list) {
    bool result = true;

    if (list.length != 0) {
      for (var object in list) {
        if (object == string) {
          result = false;
        }
      }
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return status
        ? Text(category)
        : ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: branchs.length,
            itemBuilder: (context, index) => Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(branchs[index]),
                  ],
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: listRooms[index].length,
                  itemBuilder: (context, index2) => Row(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        child: GestureDetector(
                          onTap: () {
                            String branch = branchs[index];
                            String room = listRooms[index][index2];
                            MaterialPageRoute route = MaterialPageRoute(
                              builder: (context) => ShowPicture(room: room, branch: branch,),
                            );Navigator.push(context, route);
                          },
                          child: Card(
                            child: Center(
                              child: Text(listRooms[index][index2]),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
  }
}
