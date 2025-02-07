import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/customs/constant.dart';
import 'package:social_media_app/customs/onboarding_page.dart';
import 'package:social_media_app/home/home_page.dart';
import 'package:social_media_app/login/login_provider.dart';
import 'package:social_media_app/posts/post_provider.dart';
import 'package:social_media_app/register/register_provider.dart';

void main() async {
  await GetStorage.init();
  final box = GetStorage();
  bool hasdate = box.hasData(isllogedin);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => RegisterProvider()),
      ChangeNotifierProvider(create: (_) => LoginProvider()),
      ChangeNotifierProvider(create: (_)=>PostProvider())
    ],
    child: MaterialApp(
      home: hasdate ? HomePage() : OnboardingPage(),
    ),
  ));
}
