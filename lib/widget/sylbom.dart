import 'package:citkmutnb/utility/my_style.dart';
import 'package:flutter/material.dart';

class Sylbom extends StatefulWidget {
  @override
  _SylbomState createState() => _SylbomState();
}

class _SylbomState extends State<Sylbom> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(25),
      children: <Widget>[
        showlogo(),
        Mystyle().showTitle('คัตเตอร์'),
        symbol1(),
        Mystyle().mySizeBox(20.0),
        Mystyle().showTitle('Der Scheibenfräser'),
        symbol2(),
      ],
    );
  }

  Container showlogo() => Container(
        width: 250.0,
        height: 250.0,
        child: Image.asset('images/logo.png'),
      );

  Text symbol1() => Text(
      '   สัญลักษณ์แห่งความหลักแหลม เชี่ยวชาญในการประยุกต์องค์ความรู้ สู่การสร้าง ออกแบบและพัฒนางาน เทคโนโลยี และนวัตกรรม ให้สามารถใช้งานและเกิดประโยชน์ได้อย่างแท้จริงซึ่งเป็นคุณลักษณะและวัฒนธรรมการคิดเป็น ทำเป็น สามารถสร้างงาน สิ่งประดิษฐ์ และนวัตกรรม ให้ใช้ประโยชน์ได้จริงของประชาคมชาว มจพ. มาตั้งแต่ก่อตั้งมหาวิทยาลัยเทคโนโลยีพระจอมเกล้าพระนครเหนือ (มจพ.) ด้วยความร่วมมือทางด้านวิชาการและเศรษฐกิจระหว่างรัฐบาลไทยและรัฐบาลเยอรมันเมื่อวันที่ 19 กุมภาพันธ์ พ.ศ. 2502 จนกระทั่งปัจจุบัน');
  Text symbol2() => Text(
      '   Die Entwicklung des Scheibenfräsers steht beispielhaft für die Innovationskraft und Expertise der KMUTNB in technologischer Entwicklung und Anwendung. Diese Kompetenzen, verbunden mit ihrer Nutzbarmachung für die Gesellschaft, markieren das besondere Profil und die Tradition der Universität, die am 19. Februar 1959 als Ergebnis der thai-deutschen Kooperation gegründet wurde.');
}
