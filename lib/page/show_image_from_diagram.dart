import 'dart:convert';

import 'package:citkmutnb/models/image_diagram_model.dart';
import 'package:citkmutnb/page/show_big_picture.dart';
import 'package:citkmutnb/utility/my_constant.dart';
import 'package:citkmutnb/utility/my_style.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/image_diagram_model.dart';

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
    // print('result ====>>> $result');
    int indexCard = 0;
    for (var map in result) {
      ImageDiagramModel model = ImageDiagramModel.fromJson(map);
      Widget widget = createCard(model, indexCard);
      setState(() {
        imageDiagramModels.add(model);
        widgets.add(widget);
      });
      indexCard++;
    }
  }

  Widget createCard(ImageDiagramModel model, int indexCard) {
    String string = '${MyConstant().domain}/cit/image_diagram/${model.imgName}';
    print('urlImage ===>> $string');
    return GestureDetector(
      onTap: () {
        print('You Click $indexCard');
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShowBigPicture(
                model: imageDiagramModels[indexCard],
              ),
            ));
      },
      child: Card(
        child: Image.network(string),
      ),
    );
  }
}
