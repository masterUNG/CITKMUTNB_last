import 'package:citkmutnb/utility/my_style.dart';
import 'package:flutter/material.dart';

class Myboss extends StatefulWidget {
  @override
  _MybossState createState() => _MybossState();
}

class _MybossState extends State<Myboss> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('คณะผู้บริหาร'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Mystyle().mySizeBox(20.0),
            row1(),
            Mystyle().mySizeBox(20.0),
            row2(),
            Mystyle().mySizeBox(20.0),
            row3(),
            Mystyle().mySizeBox(20.0),
            row4(),
            Mystyle().mySizeBox(20.0),
            row5(),
            Mystyle().mySizeBox(20.0),
            row6(),
            Mystyle().mySizeBox(20.0),
          ],
        ),
      ),
    );
  }

  Row row1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        createImage('persor1'),
      ],
    );
  }

  Row row2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        createImage('persor2'),
        createImage('persor3'),
      ],
    );
  }

  Row row3() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        createImage('persor4'),
        createImage('persor5'),
      ],
    );
  }

  Row row4() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        createImage('persor6'),
        createImage('persor7'),
      ],
    );
  }

  Row row5() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        createImage('persor8'),
        createImage('persor9'),
      ],
    );
  }

  Row row6() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        createImage('persor10'),
        createImage('persor11'),
      ],
    );
  }

  Container createImage(String string) => Container(
        width: 180.0,
        height: 230.0,
        child: Image.asset('images/$string.png'),
      );
}
