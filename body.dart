import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          //스토리 부분이다 Row 가 감싸고 있는 리스트뷰로 구현할것이다.
          height: size.height * 0.13,
          color: Colors.black38,

        ),
        Container(
          height: size.height * 0.08,
          width: size.width,
          color: Colors.black26,
          child: Text(
            '배너광고 자리',
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}