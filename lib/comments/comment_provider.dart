import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:social_media_app/customs/constant.dart';
import 'package:social_media_app/login/login_provider.dart';
import 'package:http/http.dart' as http;

class CommentProvider extends ChangeNotifier {
  String? _commentText;
  String get commenText => _commentText!;
  LoginProvider login = LoginProvider();

  getcomentText(String comment) {
    _commentText = comment;
    notifyListeners();
  }

  addcomment(String PId, BuildContext context) async {
    await login.getuser();
    var date = <String, dynamic>{
      "postId": PId,
      "text": commenText,
      "name": login.user!.username
    };
    var response = await http.post(
      Uri.parse(endpoint + "post/$PId/comment"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(date),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Succsefully somment"),
        ),
      );
      print(response.body);
    } else {
      print(response.body);
    }
  }
}
