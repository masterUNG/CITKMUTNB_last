import 'package:flutter/material.dart';

class Person extends StatefulWidget {
  @override
  _PersonState createState() => _PersonState();
}

class _PersonState extends State<Person> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('คณะผู้บริหาร'),
      ),
      body: Column(
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(width: 140.0, height: 220.0,
                child: Image.asset('images/persor1.png'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
