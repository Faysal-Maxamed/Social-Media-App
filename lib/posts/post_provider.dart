import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:social_media_app/customs/constant.dart';
import 'package:social_media_app/posts/post_model.dart';
import 'package:http/http.dart' as http;

class PostProvider extends ChangeNotifier {
  List<PostModel> posts = [];

  Future fetchposts() async {
    var response = await http.get(Uri.parse(endpoint + "post"));
    if (response.statusCode == 200) {
      print(response.body);
      List decodedate = jsonDecode(response.body);
      posts = decodedate.map((e) => PostModel.fromJson(e)).toList();
      notifyListeners();
    } else {
      print(response.body);
    }
  }
}
