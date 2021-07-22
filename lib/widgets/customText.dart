import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  late String title;
  late Color color;
  late FontWeight fontWeight;
  late double fontSize;

  CustomText({
    required this.title,
    required this.color,
    required this.fontWeight,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight
      ),
    );
  }
}
