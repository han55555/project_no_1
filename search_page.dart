import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'memo.dart';
import 'provider_memos.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';

class Search_page extends StatefulWidget {
  const Search_page({Key? key}) : super(key: key);

  @override
  _Search_pageState createState() => _Search_pageState();
}

class _Search_pageState extends State<Search_page> {
  final memoListKey = GlobalKey<_Search_pageState>();
  TextEditingController memoController = new TextEditingController();
  Dio dio = Dio(BaseOptions(
      contentType: 'application/json', responseType: ResponseType.json));

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          keyboardType: TextInputType.text,
         /* onChanged: (text){
            _streamSearch.add(text);
          }, */
          decoration: InputDecoration(
              hintText: 'what is lang?',//lang(0),
              border: InputBorder.none,
              icon: Padding(
                  padding: EdgeInsets.only(left: 13),
                  child: Icon(Icons.search))),
        )
      ],
    );
  }
}
