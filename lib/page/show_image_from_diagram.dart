import 'dart:convert';

import 'package:citkmutnb/models/image_diagram_model.dart';
import 'package:citkmutnb/utility/my_constant.dart';
import 'package:citkmutnb/utility/my_style.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ShowImageFromDiagram extends StatefulWidget {
  final String nameRoom;
  ShowImageFromDiagram({Key key, this.nameRoom}) : super(key: key);
  @override
  _ShowImageFromDiagramState createState() => _ShowImageFromDiagramState();
}

class _ShowImageFromDiagramState extends State<ShowImageFromDiagram> {
  String nameRoom;
  List<ImageDiagramModel> imageDiagramModels = List();
  List<Widget> widgets = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameRoom = widget.nameRoom;
    if (nameRoom == null) {
      nameRoom = '';
    }
    print('nameRoom ==> $nameRoom');

    readAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nameRoom),
      ),
      body: widgets.length == 0
          ? Mystyle().showProgress()
          : GridView.extent(
              maxCrossAxisExtent: 200,
              children: widgets,
            ),
    );
  }

  Future<Null> readAPI() async {
    String url =
        '${MyConstant().domain}/cit/getDiagramWherenameRoom.php?isAdd=true&nameroom=$nameRoom';
    Response response = await Dio().get(url);
    var result = json.decode(response.data);
    print('result ====>>> $result');
    for (var map in result) {
      ImageDiagramModel model = ImageDiagramModel.fromJson(map);
      Widget widget = createCard(model);
      setState(() {
        imageDiagramModels.add(model);
        widgets.add(widget);
      });
    }
  }

  Widget createCard(ImageDiagramModel model) {
    String string = '${MyConstant().domain}/cit/image_diagram/${model.imgName}';
    print('urlImage ===>> $string');
    return Card(
      child: Image.network(string),
    );
  }
}
