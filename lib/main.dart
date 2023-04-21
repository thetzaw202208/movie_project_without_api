import 'package:flutter/material.dart';
import 'package:movie_project/constants/colors.dart';
import 'package:movie_project/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Project',
      home: MovieHomeScreen(),
    );
  }
}


