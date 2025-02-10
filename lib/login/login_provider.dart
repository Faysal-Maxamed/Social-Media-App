import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:social_media_app/customs/constant.dart';
import 'package:social_media_app/home/home_page.dart';
import 'package:social_media_app/login/login_model.dart';

class LoginProvider extends ChangeNotifier {
  String? _username;
  String? _password;
  LoginModel? user;
  final box = GetStorage();

  LoginProvider() {
    getuser();
  }

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

  login(BuildContext context) async {
    var date = <String, dynamic>{"username": username, "password": password};

    var response = await http.post(
      Uri.parse(endpoint + "users/login"),
      body: jsonEncode(date),
      headers: {"Content-Type": "application/json"},
    );
    print(date);
    if (response.statusCode == 200) {
      var jsondecode = jsonDecode(response.body);
      var user = LoginModel.fromJson(jsondecode);
      SnackBar(
        content: Text("Succsess"),
      );
      print(user.email);
      saveuser(user!);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => HomePage(),
        ),
      );
    } else {
      print(response.body);
    }
  }

  saveuser(LoginModel user) {
    box.write(userInfo, user.toJson());
    box.write(isllogedin, "isllogedin");
  }

  getuser() {
    bool hasdate = box.hasData(userInfo);
    if (hasdate == true) {
      var date = box.read(userInfo);
      user = LoginModel.fromJson(date);
      notifyListeners();
    } else {
      return null;
    }
  }
}
