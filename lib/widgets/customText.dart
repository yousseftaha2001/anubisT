import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  late String title;
  late Color color;
  late FontWeight fontWeight;
  late double fontSize;
  late bool left = true;

  CustomText({
    required this.title,
    required this.color,
    required this.fontWeight,
    required this.fontSize,
  });

  CustomText.direction({
    required this.title,
    required this.color,
    required this.fontWeight,
    required this.fontSize,
    required this.left
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textDirection:left?TextDirection.ltr: TextDirection.rtl,
      style:
          TextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight),
    );
  }
}
