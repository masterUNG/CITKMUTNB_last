import 'package:citkmutnb/utility/my_style.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Path extends StatefulWidget {
  @override
  _PathState createState() => _PathState();
}

class _PathState extends State<Path> {
  List<String> builds = ['42', '62', '63', '64', '65', '66', '67', '68', '69'];
  List<Color> colors = [
    Colors.red,
    Colors.amber,
    Colors.blue,
    Colors.cyan,
    Colors.green,
    Colors.lime,
    Colors.yellow,
    Colors.pink,
    Colors.purple
  ];
  List<Widget> widgets = List();
  LatLng centerMap = LatLng(13.819363, 100.514537);

  @override
  void initState() {
    super.initState();
    int index = 0;
    for (var string in builds) {
      Widget widget = createCard(string, colors[index]);
      index++;
      setState(() {
        widgets.add(widget);
      });
    }
  }

  Marker build42() {
    LatLng latLng = LatLng(13.818744, 100.514199);
    return Marker(
      markerId: MarkerId('build42'),
      position: latLng,
      infoWindow: InfoWindow(title: 'อาคาร 42', snippet: 'อธิบาย อาคาร'),
      icon: BitmapDescriptor.defaultMarkerWithHue(60),
    );
  }

  Marker build62() {
    LatLng latLng = LatLng(13.819124, 100.514548);
    return Marker(
      markerId: MarkerId('build42'),
      position: latLng,
      infoWindow: InfoWindow(title: 'อาคาร 62', snippet: 'อธิบาย อาคาร'),
      icon: BitmapDescriptor.defaultMarkerWithHue(160),
    );
  }

  Marker build63() {
    LatLng latLng = LatLng(13.819489, 100.515026);
    return Marker(
      markerId: MarkerId('build42'),
      position: latLng,
      infoWindow: InfoWindow(title: 'อาคาร 63', snippet: 'อธิบาย อาคาร'),
      icon: BitmapDescriptor.defaultMarkerWithHue(260),
    );
  }

  Marker build64() {
    LatLng latLng = LatLng(13.819333, 100.513364);
    return Marker(
      markerId: MarkerId('build64'),
      position: latLng,
      infoWindow: InfoWindow(title: 'อาคาร 64', snippet: 'อธิบาย อาคาร'),
      icon: BitmapDescriptor.defaultMarkerWithHue(100),
    );
  }

  Marker build65() {
    LatLng latLng = LatLng(13.819700, 100.513896);
    return Marker(
      markerId: MarkerId('build42'),
      position: latLng,
      infoWindow: InfoWindow(title: 'อาคาร 65', snippet: 'อธิบาย อาคาร'),
      icon: BitmapDescriptor.defaultMarkerWithHue(200),
    );
  }

  Marker build66() {
    LatLng latLng = LatLng(13.820038, 100.514370);
    return Marker(
      markerId: MarkerId('build66'),
      position: latLng,
      infoWindow: InfoWindow(title: 'อาคาร 63', snippet: 'อธิบาย อาคาร'),
      icon: BitmapDescriptor.defaultMarkerWithHue(300),
    );
  }

  Set<Marker> mySet() {
    return <Marker>[
      build42(),
      build62(),
      build63(),
      build64(),
      build65(),
      build66()
    ].toSet();
  }

  Widget createCard(String string, Color color) {
    return Row(
      children: [
        Icon(Icons.location_on, color: color,),
        Text('อาคาร $string'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: centerMap,
                zoom: 16,
              ),
              onMapCreated: (controller) {},
              markers: mySet(),
            ),
          ),
          widgets.length == 0
              ? Mystyle().showProgress()
              : Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [widgets[0], widgets[1], widgets[2]],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [widgets[3], widgets[4], widgets[5]],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [widgets[6], widgets[7], widgets[8]],
                    ),
                  ],
                )
        ],
      ),
    );
  }
}
