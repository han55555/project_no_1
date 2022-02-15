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
        appBar: AppBar(),
        body: Container(
          color: Colors.white,
          height: 130,
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Image.asset('assets/birthday-ge07f1a112_640.png'),
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '선물상자입니다 어쩌구저쩌구',
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(
                        '금호동 3가',
                        style: TextStyle(
                          color: Color(0xb0110a0a),
                        ),
                      ),
                      Text('234,000원'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.favorite_border),
                          Text('4'),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
