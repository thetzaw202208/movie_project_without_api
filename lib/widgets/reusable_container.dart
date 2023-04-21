import 'package:flutter/material.dart';

import '../constants/colors.dart';

class ReusableContainer extends StatelessWidget {
  const ReusableContainer(
      {Key? key,
        required this.child,
        this.width = 60,
        this.height = 40,
        this.color})
      : super(key: key);
  final Widget child;
  final double width;
  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: color ?? secondaryColor,
      ),
      child: child,
    );
  }
}