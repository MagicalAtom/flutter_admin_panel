import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText(
      {super.key,
      required this.text,
      this.color = Colors.black,
      this.fontSize = 15,
      this.fontFamily = '',
      this.fontWeight = FontWeight.w500});

  String text;
  Color color;
  double fontSize;
  FontWeight fontWeight;
  String fontFamily;

  @override
  Widget build(BuildContext context) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
    ),
  );
  }
}
