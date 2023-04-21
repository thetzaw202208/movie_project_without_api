import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movie_project/constants/colors.dart';
import 'package:movie_project/constants/dimens.dart';

class ReusableTextWidget extends StatelessWidget {
  const ReusableTextWidget({
    required this.text,
    this.fontWeight,
    this.fontSize,
    this.color,
    this.maxLine,
    this.lineHeight = 1,
    this.style,
    Key? key,
  }) : super(key: key);
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final int? maxLine;
  final double lineHeight;
  final TextDecoration? style;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine,


      style: TextStyle(

          decoration: style,
          height: lineHeight,
          color: color,
          fontWeight: fontWeight ?? fBold,
          fontSize: fontSize ?? textSize14),
    );
  }
}
