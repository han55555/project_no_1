import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project_flutter/home_screen.dart';
import 'provider_memos.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Memos()),
      ],
      child: const MyApp(),
    )
  );
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




