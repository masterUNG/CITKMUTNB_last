import 'package:citkmutnb/page/pak1.dart';
import 'package:citkmutnb/utility/my_style.dart';
//import 'package:citkmutnb/widget/pak1.dart';
import 'package:flutter/material.dart';

class Departmentpage extends StatefulWidget {
  @override
  _DepartmentpageState createState() => _DepartmentpageState();
}

class _DepartmentpageState extends State<Departmentpage> {
  List<String> categorys = [
    'เครื่องกล',
    'ไฟฟ้า',
    'โยธา',
    'วิทย์ประยุกต์และสังคม',
    'อุตสาหการ',
    'เครื่องต้นกำลัง',
    'อิเล็กทรอนิกส์',
    'การจัดการเทคโนฯและสารสนเทศ',
    'การเชื่อม',
    'เตรียมวิศวกรรมไทย-เยอรมัน'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            createimg(
                ('Pak1'),
                Pak1(
                  nameImage: 'Pak1',
                  title: 'ภาควิชาเทคโนโลยีวิศวกรรมเครื่องกล',
                  category: categorys[0],
                )),
            createimg(
                ('Pak2'),
                Pak1(
                  nameImage: 'Pak2',
                  title: 'ภาควิชาเทคโนโลยีวิศวกรรมไฟฟ้า',
                  category: categorys[1],
                )),
          ],
        ),
        Mystyle().fixSizeBox(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            createimg(
                ('Pak3'),
                Pak1(
                  nameImage: 'Pak3',
                  title: 'ภาควิชาเทคโนโลยีวิศวกรรมโยธาและสิ่งแวดล้อม',
                  category: categorys[2],
                )),
            createimg(
                ('Pak4'),
                Pak1(
                  nameImage: 'Pak4',
                  title: 'ภาควิชาวิทยาศาสตร์และสังคม',
                  category: categorys[3],
                )),
          ],
        ),
        Mystyle().fixSizeBox(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            createimg(
                ('Pak5'),
                Pak1(
                  nameImage: 'Pak5',
                  title: 'ภาควิชาเทคโนโลยีวิศวกรรมอุตสาหการ',
                  category: categorys[4],
                )),
            createimg(
                ('Pak6'),
                Pak1(
                  nameImage: 'Pak6',
                  title: 'ภาควิชาเทคโนโลยีวิศวกรรมเครื่องต้นกำลัง',
                  category: categorys[5],
                )),
          ],
        ),
        Mystyle().fixSizeBox(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            createimg(
                ('Pak7'),
                Pak1(
                  nameImage: 'Pak7',
                  title: 'ภาควิชาเทคโนโลยีวิศวกรรมอิเล็กทรอนิกส์',
                  category: categorys[6],
                )),
            createimg(
                ('Pak8'),
                Pak1(
                  nameImage: 'Pak8',
                  title: 'ภาควิชาการจัดการเทคโนโลยีการผลิตและสารสนเทศ',
                  category: categorys[7],
                )),
          ],
        ),
        Mystyle().fixSizeBox(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            createimg(
                ('Pak9'),
                Pak1(
                  nameImage: 'Pak9',
                  title: 'ภาควิชาเทคโนโลยีวิศวกรรมการเชื่อม',
                  category: categorys[8],
                )),
            createimg(
                ('Pak10'),
                Pak1(
                  nameImage: 'Pak10',
                  title: 'โรงเรียนตรียมวิศวกรรมศาสตร์ไทย-เยอรมัน',
                  category: categorys[9],
                )),
          ],
        ),
      ],
    );
  }

  Widget createimg(String nameimg, Widget widget) => GestureDetector(
        onTap: () {
          MaterialPageRoute route = MaterialPageRoute(
            builder: (context) => widget,
          );
          Navigator.push(context, route);
        },
        child: Container(
          child: Image.asset('images/$nameimg.png'),
          width: 300,
          height: 200,
        ),
      );
  // {FlatButton(onPressed: null, child: null)
  //   return Container(
  //     width: 300.0,
  //     height: 200.0,
  //     child: Image.asset('images/$nameimg.png'),
  //   );
  // }
}
