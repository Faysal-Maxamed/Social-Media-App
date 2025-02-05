import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/customs/onboarding_page.dart';
import 'package:social_media_app/login/login_provider.dart';
import 'package:social_media_app/register/register_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_)=>RegisterProvider()),
      ChangeNotifierProvider(create: (_)=>LoginProvider())
    ],
    child: MaterialApp(
      home: OnboardingPage(),
    ),
  ));
}


