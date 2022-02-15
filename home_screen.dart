import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:project_flutter/body.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _selectedIndex = 0;
  GlobalKey<CurvedNavigationBarState> _HomescreenStatekey = GlobalKey();
  List abPages = [
    Homeappbar('꿈일기 어플'),
    Homeappbar('index 1'),
    Homeappbar('index 2'),
    Homeappbar('index 3'),
  ];
  List bdPages = [
    Body(),
    Container(
      child: Text('index 1')
      ,
    ),
    Container(
      child: Text('index 2'),
    ),
    Container(
      child: Text('index 3'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: abPages[_selectedIndex],
      body: bdPages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        key: _HomescreenStatekey,
        backgroundColor: Color(0xffBE7A7B),
        animationCurve: Curves.linearToEaseOut,
        index: 0,
        items: <Widget>[
          Icon(Icons.home),
          Icon(Icons.circle),
          Icon(Icons.search_rounded),
          Icon(Icons.chat),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        letIndexChange: (index) => true,
      ),
    );
  }
}

AppBar Homeappbar(title) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    leading: IconButton(
      icon: Icon(Icons.menu),
      onPressed: () {},
    ),
    backgroundColor: Color(0xffBE7A7B),
    elevation: 0,
  );
}
