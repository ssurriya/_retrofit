import 'package:flutter/cupertino.dart';

import 'post_api.dart';
import 'package:dio/dio.dart';

class PostProvider with ChangeNotifier {
  Post? _post = Post(name: "", age: 0);
  // ignore: unused_field
  bool _isError = false;

  Post get post => _post!;
  bool get isError => _isError;

  postRequest() {
    final client =
        RestClient(Dio(BaseOptions(contentType: "application/json")));
    client.getTasks(2).then((value) {
      // ignore: unnecessary_null_comparison
      if (value != null) {
        _post = value;
      }
    }).catchError((error) {
      _isError = true;
    });
    notifyListeners();
  }
}
