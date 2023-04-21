import 'package:flutter/material.dart';
import 'package:movie_project/constants/colors.dart';

class BottomBlurEffect extends StatelessWidget {

  const BottomBlurEffect({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: const [
              0.0,
              0.4
            ],
            colors: [
              primaryColor.withOpacity(1.0),
              primaryColor.withOpacity(0.0)
            ]),
      ),
    );
  }
}