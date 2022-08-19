import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:random_color/random_color.dart';

RandomColor _randomColor = RandomColor();
Color _color = _randomColor.randomColor();

class GradeContainer extends StatelessWidget {
  final String grade;
  final Color randomColor;
  const GradeContainer(this.grade , this.randomColor);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(14.w, 16, 14.w, 16),
    height: 65,
    decoration: BoxDecoration(
      color: randomColor,
    //color: Color.fromRGBO(110, 203, 99, 1),
    borderRadius: BorderRadius.all(Radius.circular(25)),
    ),
    child: Center(
    child: Text(
    '$grade',
    textScaleFactor: 1.0,
    style: TextStyle(
    color: Colors.black,
    fontFamily: 'Lato-regular',
    fontWeight: FontWeight.w400,
    letterSpacing: 1,
    fontSize: 20,
    ),
    ),
    ),
    );
  }
}
