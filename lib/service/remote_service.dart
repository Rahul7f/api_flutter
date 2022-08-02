import 'package:api_flutter/model/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RemoteService {



  Future<List<Post>?> getPost() async {
    var client = http.Client();

    var uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    var response = await client.get(uri);

    if (response.statusCode == 200) {
       var json = response.body;
       debugPrint("success");
      return postFromJson(json);
    } else {
      //handle error
      debugPrint("error");
    }
    return null;
  }
}
