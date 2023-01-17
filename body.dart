import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart';
import 'memo.dart';
import 'provider_memos.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final memoListKey = GlobalKey<_BodyState>();
  Dio dio = Dio(BaseOptions(
      contentType: 'application/json', responseType: ResponseType.json));

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Memo> memos = context.watch<Memos>().memos;
    return Column(
      children: <Widget>[
        Container(
          //스토리 부분이다 Row 가 감싸고 있는 리스트뷰로 구현할것이다.
          height: size.height * 0.13,
          color: Colors.black38,
        ),
        Expanded(
            child: ListView.builder(
          itemCount: memos.length,
          itemBuilder: (BuildContext context, int index) {
            var data = memos[index];
            return Card(
                child: ListTile(
              leading: Icon(Icons.person),
              trailing: Icon(Icons.view_list),
              title: Text(
                data.date,
                style: TextStyle(fontSize: 20),
              ),
              tileColor: HexColor.fromHex(data.color),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Details(memo: data),
                  ),
                );
                setState(() {
                  memos = context.watch<Memos>().memos;
                });
              },
            ));
          },
        )),
      ],
    );
  }
}

class Details extends StatefulWidget {
  final Memo memo;
  Details({required this.memo});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  Dio dio = Dio();

  void deleteMemo(context) async {
    var formData = FormData.fromMap({'date': widget.memo.date.toString()});

    await dio.post("http://10.0.2.2/flutter_project/delete.php",
        data: formData);
    Navigator.pop(context);
    Navigator.pop(context);
  }

  void confirmDelete(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text("삭제하겠습니까?"),
            actions: <Widget>[
              ElevatedButton(
                child: Icon(Icons.cancel),
                onPressed: () => Navigator.pop(context),
              ),
              ElevatedButton(
                child: Icon(Icons.check_circle),
                onPressed: () {
                  deleteMemo(context);
                  context.read<Memos>().getMemoList();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("나의 꿈"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => confirmDelete(context),
          ),
        ],
      ),
      body: Container(
        height: 270.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 30.0,
              color: HexColor.fromHex(widget.memo.color),
            ),
            Text(
              "${widget.memo.memo}",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
