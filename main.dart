import 'package:flutter/material.dart';

import 'package:project_flutter/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '꿈일기 어플',
      debugShowCheckedModeBanner: false,
      home: Homescreen(),
    );
  }
}




