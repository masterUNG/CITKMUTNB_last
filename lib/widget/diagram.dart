import 'dart:convert';

import 'package:citkmutnb/models/image_diagram_model.dart';
import 'package:citkmutnb/page/mycontent.dart';
import 'package:citkmutnb/page/show_image_from_diagram.dart';
import 'package:citkmutnb/utility/my_constant.dart';
import 'package:citkmutnb/utility/my_style.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Diagram extends StatefulWidget {
  @override
  _DiagramState createState() => _DiagramState();
}

class _DiagramState extends State<Diagram> {
  List<String> builds = ['42', '62', '63', '65'];
  List<List<ImageDiagramModel>> listModel = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readAPI();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(25),
      children: <Widget>[
        showlogo(),
        listModel.length == 0 ? Mystyle().showProgress() : buildListDetail(),
      ],
    );
  }

  Widget buildListDetail() => ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: builds.length,
        itemBuilder: (context, index) => Column(
          children: [
            buildTextBuilding(index),
            buildTextNameRoom(index),
          ],
        ),
      );

  Widget buildTextNameRoom(int index) => ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: listModel[index].length,
        itemBuilder: (context, index2) => GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShowImageFromDiagram(nameRoom: listModel[index][index2].nameroom),
            ),
          ),
          child: Text(listModel[index][index2].nameroom),
        ),
      );

  Widget buildTextBuilding(int index) {
    return Row(
      children: [
        Text(
          'อาคาร ${builds[index]}',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Container showlogo() => Container(
        width: MediaQuery.of(context).size.width,
        height: 260,
        child: Image.asset(
          'images/diagram.png',
          fit: BoxFit.cover,
        ),
      );

  bool checkDulicate(String string, List<ImageDiagramModel> list) {
    bool result = true;

    if (list.length != 0) {
      for (var object in list) {
        if (object.nameroom == string) {
          result = false;
        }
      }
    }

    return result;
  }

  Future<Null> readAPI() async {
    for (var buildName in builds) {
      String url =
          '${MyConstant().domain}/cit/getDiagramWhereBuild.php?isAdd=true&build=$buildName';

      Response response = await Dio().get(url);
      var result = json.decode(response.data);
      List<ImageDiagramModel> models = List();
      for (var map in result) {
        ImageDiagramModel model = ImageDiagramModel.fromJson(map);
        String nameRoom = model.nameroom;

        if (checkDulicate(nameRoom, models)) {
          models.add(model);
        }
      }
      setState(() {
        listModel.add(models);
      });
    }
  }
}
