import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:social_media_app/customs/constant.dart';

class LoginProvider extends ChangeNotifier {
  String? _username;
  String? _password;

  String get username => _username!;
  String get password => _password!;

  getusername(String username) {
    _username = username;
    notifyListeners();
  }

  getpassword(String password) {
    _password = password;
    notifyListeners();
  }

  login() async {
    var date = <String, dynamic>{"username": username, "password": password};

    var response = await http.post(
      Uri.parse(endpoint + "users"),
      body: jsonEncode(date),
      headers: {"Content-Type": "application/json"},
    );
  }
}
