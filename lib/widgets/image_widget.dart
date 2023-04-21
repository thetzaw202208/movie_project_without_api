import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  ImageWidget({Key? key, required this.imgUrl,this.width,this.height,this.color}) : super(key: key);
  final String imgUrl;
  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imgUrl,
      width: width,
      height: height,
      color: color,
      fit: BoxFit.cover,
    );
  }
}
