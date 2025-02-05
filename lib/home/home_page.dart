import 'package:flutter/material.dart';
import 'package:social_media_app/customs/constant.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: btnclr,
        title: Text("Social Media App"),
      ),
    );
  }
}