import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:project_flutter/body.dart';
import 'package:project_flutter/search_page.dart';
import 'provider_memos.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

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
    Search_page(),
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
              leading: Icon(Icons.contact_page),
              title: Text('아직 미정'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.contact_page),
              title: Text('아직 미정'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.contact_page),
              title: Text('아직 미정'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.contact_page),
              title: Text('아직 미정'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.contact_page),
              title: Text('아직 미정'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
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
  Color pickerColor = Color(0xffffffff);
  Color currentColor = Color(0xffffffff);

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  Future _createMemo() async {
    var formData = FormData.fromMap(
      {
        "color": currentColor.toHex(),
        "memo": memoController.text,
        "user_id": 'user_1',
      },
    );
    return await dio.post("http://10.0.2.2/flutter_project/insert.php",
        data: formData);
  }

  void _onConfirm(context) async {
    await _createMemo();
    Navigator.pop(context);
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
                context.read<Memos>().getMemoList();
              },
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Column(children: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: TextStyle(fontSize: 18),
              ),
              child: Text('색감선택'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Pick a color!'),
                      content: SingleChildScrollView(
                        child: BlockPicker(
                          pickerColor: currentColor,
                          onColorChanged: changeColor,
                        ),
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          child: const Text('Got it'),
                          onPressed: () {
                            setState(() => currentColor = pickerColor);
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
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
}
