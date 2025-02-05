import 'dart:convert';
import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:social_media_app/customs/constant.dart';
import 'package:social_media_app/login/loginpage.dart';

class RegisterProvider extends ChangeNotifier {
  String? _username;
  String? _email;
  String? _password;
  File? _image;

  String get username => _username!;
  String get password => _password!;
  String get email => _email!;
  File? get image => _image;

  getusername(String username) {
    _username = username;
    notifyListeners();
  }

  getemail(String email) {
    _email = email;
    notifyListeners();
  }

  getpassword(String password) {
    _password = password;
    notifyListeners();
  }

  Future getImage() async {
    var imagepicker =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imagepicker != null) {
      _image = File(imagepicker.path);
    }
    notifyListeners();
  }

  register(BuildContext context) async {
    String imageurl = '';
    final cloudinary =
        CloudinaryPublic('dsqdn5uib', 'ml_default', cache: false);

    CloudinaryResponse responsecloud = await cloudinary.uploadFile(
      CloudinaryFile.fromFile(image!.path,
          resourceType: CloudinaryResourceType.Image),
    );

    imageurl = responsecloud.secureUrl;

    if (imageurl.isNotEmpty) {
      try {
        var date = <String, dynamic>{
          "username": username,
          "email": email,
          "image": imageurl,
          "password": password
        };
        var response = await http.post(Uri.parse(endpoint + "users/"),
            body: jsonEncode(date),
            headers: {"Content-Type": "application/json"});

        if (response.statusCode == 201) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Succesfyly register"),
            ),
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => Loginpage(),
            ),
          );
        } else {
          print(response.body);
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("error$e"),
          ),
        );
        print(e);
      }
    }
  }
}
