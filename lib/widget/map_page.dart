import 'package:citkmutnb/widget/diagram.dart';
import 'package:citkmutnb/widget/path.dart';
import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 100,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("แผนที่",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      )),
                  // background: Image.network(
                  //   "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                  //   fit: BoxFit.cover,
                  // ),
                ),
              ),
              // SliverAppBar(
              //   title: Text('แผนที่'),
              //   snap: true,
              //   floating: true,
              //   elevation: 6,
              //   expandedHeight: 50,
              //   pinned: true,
              //   // flexibleSpace: FlexibleSpaceBar(
              //   //   background: Image.asset(
              //   //     'images/Pak7.png',
              //   //     fit: BoxFit.cover,
              //   //   ),
              //   // ),
              // ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelColor: Colors.blue,
                    tabs: [
                      Tab(
                        text: 'แผนผัง',
                      ),
                      Tab(
                        text: 'เส้นทาง',
                      ),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: <Widget>[
              Diagram(),
              Path(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
