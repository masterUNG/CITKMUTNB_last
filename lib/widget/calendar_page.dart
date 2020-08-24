import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CalenderPage extends StatefulWidget {
  @override
  _CalenderPageState createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: WebView(
      initialUrl: 'http://acdserv.kmutnb.ac.th/academic-calendar',
      javascriptMode: JavascriptMode.unrestricted,
    ),);
  }
}
