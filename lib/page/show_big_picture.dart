import 'package:flutter/material.dart';

import '../models/image_diagram_model.dart';
import '../models/image_diagram_model.dart';
import '../models/image_diagram_model.dart';
import '../utility/my_constant.dart';

class ShowBigPicture extends StatefulWidget {
  final ImageDiagramModel model;
  ShowBigPicture({Key key, this.model}) : super(key: key);
  @override
  _ShowBigPictureState createState() => _ShowBigPictureState();
}

class _ShowBigPictureState extends State<ShowBigPicture> {
  ImageDiagramModel model;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model = widget.model;
    print('pathImage ===>> ${model.imgName}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.nameroom),
      ),
      body: Center(
        child: Image.network(
            '${MyConstant().domain}/cit/image_diagram/${model.imgName}'),
      ),
    );
  }
}
