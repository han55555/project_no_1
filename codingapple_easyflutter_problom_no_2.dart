import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('앰입'),
          ),
          body: Text('안녕'),
          bottomNavigationBar: BottomAppBar(
            child: SizedBox(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.phone),
                  Icon(Icons.mark_as_unread_sharp),
                  Icon(Icons.contact_page),
                ],
              ),
            ),
          ),
        ));
  }
}

/*
stless + tab = stateless widght 자동생성
ctrl + space = 자동완성
 */