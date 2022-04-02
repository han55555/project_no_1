import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart';

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
    Homeappbar('index last'),
  ];
  List bdPages = [
    Body(),
    Container(
      child: Text('index 1'),
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
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
                child: Text('drawerheader 넣을지 말지 고민중'),
              decoration: BoxDecoration(color: Color(0xffBE7A7B)),
            ),

            ListTile(
              leading: Icon(
                Icons.contact_page
              ),
              title: Text('아직 미정'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(
                  Icons.contact_page
              ),
              title: Text('아직 미정'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(
                  Icons.contact_page
              ),
              title: Text('아직 미정'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(
                  Icons.contact_page
              ),
              title: Text('아직 미정'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(
                  Icons.contact_page
              ),
              title: Text('아직 미정'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
              },
            ),
          ],
        ),
      ),
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
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => WritingPage()));
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}

AppBar Homeappbar(title) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    /*leading: IconButton(
      icon: Icon(Icons.height),
      onPressed: () {},
    ),*/ //(현재) drawer 위젯으로 대체
    backgroundColor: Color(0xffBE7A7B),
    elevation: 0,
  );
}

class WritingPage extends StatefulWidget {
  const WritingPage({Key? key}) : super(key: key);

  @override
  State<WritingPage> createState() => _WritingPageState();
}

class _WritingPageState extends State<WritingPage> {
  Dio dio = Dio();
  int colorindex = 0;
  int? selectcolorindex = null;
  TextEditingController memoController = new TextEditingController();

  Future _createMemo() async {
    var formData = FormData.fromMap(
      {
        "color": selectcolorindex,
        "memo": memoController.text,
      },
    );
    return await dio.post("http://10.0.2.2/flutter_project/insert.php", data: formData);
  }

  void _onConfirm(context) async {
    await _createMemo();
    Navigator.pop(context);
    //이렇게 하면 creatememo가 실행된뒤에 pop이되는건가
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('꿈 추가'),
          backgroundColor: Color(0xffBE7A7B),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.accessibility_sharp),
              onPressed: () {
                _onConfirm(context);
              },
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 10, right: 10,),
          child: Column(children: <Widget>[
            Text('색감선택', style: TextStyle(fontSize: 18)),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red, onPrimary: Colors.white,),
                    child: (colorindex == selectcolorindex ? Text('checked') : Text('red')),
                    onPressed: () {
                      colorChecked();
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.green, onPrimary: Colors.white,),
                    child: (colorindex+1 == selectcolorindex ? Text('checked') : Text('green')),
                    onPressed: () {
                      colorChecked(1);
                    }
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.blue, onPrimary: Colors.white,),
                    child: (colorindex+2 == selectcolorindex ? Text('checked') : Text('blue')),
                    onPressed: () {
                      colorChecked(2);
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.indigo, onPrimary: Colors.white,),
                    child: (colorindex+3 == selectcolorindex ? Text('checked') : Text('indigo')),
                    onPressed: () {
                      colorChecked(3);
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.grey, onPrimary: Colors.white,),
                    child: (colorindex+4 == selectcolorindex ? Text('checked') : Text('grey')),
                    onPressed: () {
                      colorChecked(4);
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.pink, onPrimary: Colors.white,),
                    child: (colorindex+5 == selectcolorindex ? Text('checked') : Text('pink')),
                    onPressed: () {
                      colorChecked(5);
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.white, onPrimary: Colors.black,),
                    child: (colorindex+6 == selectcolorindex ? Text('checked') : Text('other')),
                    onPressed: () {
                      colorChecked(6);
                    },
                  ),
                ],
              ),
            ),

            Column(
                  children: <Widget>[
                    TextField(
                      controller: memoController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: '작성공간'),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    )
                  ],
                ),
          ]),
        ));
  }
  void colorChecked([int index = 0]) {
    setState(() {
      colorindex+index == selectcolorindex ? selectcolorindex = null : selectcolorindex = index;
    });
  }
}
