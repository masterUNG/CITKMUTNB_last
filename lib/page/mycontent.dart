import 'package:citkmutnb/page/show_list_degee.dart';
import 'package:citkmutnb/utility/my_style.dart';
import 'package:flutter/material.dart';

class Mycontent extends StatefulWidget {
  @override
  _MycontentState createState() => _MycontentState();
}

class _MycontentState extends State<Mycontent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('หลักสูตร'),
      ),
      body: Column(
        children: <Widget>[
          Mystyle().mySizeBox(50.0),
          buttonTop(),Mystyle().mySizeBox(15.0),
          buttonMediumTop(),Mystyle().mySizeBox(15.0),
          mediumbuttom(),Mystyle().mySizeBox(15.0),
          buttonButton(),
        ],
      ),
    );
  }

  Widget buttonTop() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 320.0, height: 40.0,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.orange,
            onPressed: () => routeToDegee(0),
            child: Text(
              'ปริญญาเอก',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  void routeToDegee(int index) {
    MaterialPageRoute route = MaterialPageRoute(
      builder: (context) => ShowListDegee(
        degeeAInt: index,
      ),
    );
    Navigator.push(context, route);
  }

  Widget buttonMediumTop() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 320.0,height: 40.0,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.orange,
            onPressed: () => routeToDegee(1),
            child: Text(
              'ปริญญาโท',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget mediumbuttom() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 320.0,height: 40.0,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.orange,
            onPressed: () => routeToDegee(2),
            child: Text(
              'ปริญญาตรี',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget buttonButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 320.0,height: 40.0,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.orange,
            onPressed: () {},
            child: Text(
              'ประกาศนียบัตรวิชาชีพ',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
