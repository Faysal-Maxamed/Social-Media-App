import 'package:flutter/material.dart';
import 'package:social_media_app/login/loginpage.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("images/1.png"),
          ElevatedButton(
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Loginpage(),
                    ),
                  ),
              child: Text("Start"))
        ],
      ),
    );
  }
}
