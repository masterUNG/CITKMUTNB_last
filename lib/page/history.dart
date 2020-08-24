import 'package:citkmutnb/widget/history_widget.dart';
import 'package:citkmutnb/widget/story.dart';
import 'package:citkmutnb/widget/sylbom.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(title: Text('ประวัติ'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.assignment), text: 'ประวัติ',),
              Tab(icon: Icon(Icons.school), text: 'ปรัชญา',),
              Tab(icon: Icon(Icons.settings), text: 'สัญญาลักษณ์',),
              // Text('ประวัติ'),
              // Text('ปรัชญา'),
              // Text('สัญญาลักษณ์'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            HistoryWidget(),
            Story(),
            Sylbom(),
          ],
        ),
      ),
    );
  }
}
