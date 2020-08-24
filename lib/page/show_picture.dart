import 'dart:convert';

import 'package:citkmutnb/utility/my_constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ShowPicture extends StatefulWidget {
  final String room, branch;
  ShowPicture({Key key, this.room, this.branch}) : super(key: key);
  @override
  _ShowPictureState createState() => _ShowPictureState();
}

class _ShowPictureState extends State<ShowPicture> {
  String room, branch;
  List<Widget> widgets = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    room = widget.room;
    branch = widget.branch;
    readPicture();
  }

  Future<Null> readPicture() async {
    String url =
        '${MyConstant().domain}/cit/getRoomenetWhereRoomAndBranch.php?isAdd=true&room=$room&branch=$branch';
    Response response = await Dio().get(url);
    var result = json.decode(response.data);

    for (var map in result) {
      Widget myWidget = Container(
        width: 80,
        height: 80,
        child: Image.network(
            '${MyConstant().domain}/cit/image_roomenet/${map['img_name']}'),
      );
      setState(() {
        widgets.add(myWidget);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: widgets.length == 0
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(itemCount: widgets.length,
              itemBuilder: (context, index) => widgets[index],
            ),
    );
  }
}
