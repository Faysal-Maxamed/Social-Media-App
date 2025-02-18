import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:social_media_app/customs/constant.dart';
import 'package:social_media_app/login/login_provider.dart';
import 'package:social_media_app/posts/post_model.dart';
import 'package:http/http.dart' as http;

class PostProvider extends ChangeNotifier {
  List<PostModel> lisofposts = [];
  bool isloading = false;
  File? _image;
  String? _bodytext;
  String get bodyText => _bodytext!;
  File get image => _image!;
  LoginProvider login = LoginProvider();
  getbodttext(String bodytext) {
    _bodytext = bodytext;
    notifyListeners();
  }

  fetchposts() async {
    isloading = true;
    notifyListeners();
    try {
      var response = await http.get(Uri.parse(endpoint + "post"));
      if (response.statusCode == 200) {
        print(response.body);
        List decodedate = jsonDecode(response.body);
        lisofposts = decodedate.map((e) => PostModel.fromJson(e)).toList();
        notifyListeners();
      } else {
        print(response.body);
      }
    } catch (e) {
      print(e);
    }
    isloading = false;
    notifyListeners();
  }

  addpost(BuildContext context) async {
    await login.getuser();
    var date = <String, dynamic>{
      "body": bodyText,
      "name": login.user!.username,
    };

    var response = await http.post(
      Uri.parse(endpoint + "post"),
      body: jsonEncode(date),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 201) {
      fetchposts();
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Post created succsess"),
        ),
      );
      print(response.body);
    } else {
      print(response.body);
    }
  }
}
