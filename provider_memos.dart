import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'memo.dart';

class Memos with ChangeNotifier {
  List<Memo> _memos = [];
  List<Memo> get memos => _memos;

  Dio dio = Dio(BaseOptions(
      contentType: 'application/json', responseType: ResponseType.json));

  Memos() {
    getMemoList();
    notifyListeners();
  }

  void getMemoList() async {
    var responseWithDio;
    var user_inform = FormData.fromMap({
      "user_id": "user_1",
    });

    try {
      responseWithDio = await dio.post(
          "http://10.0.2.2/flutter_project/select.php",
          data: user_inform);
      _memos = (responseWithDio.data).map<Memo>((json) {
        return Memo.fromJson(json);
      }).toList();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
