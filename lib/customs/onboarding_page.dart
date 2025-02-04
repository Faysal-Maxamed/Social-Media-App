import 'package:flutter/material.dart';
import 'package:social_media_app/customs/constant.dart';
import 'package:social_media_app/login/loginpage.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: gradient),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "images/1.png",
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Welcome to Our Social Media App!\n"
                  "Connect with friends, share your moments, and explore trending topics.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade300,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Loginpage(),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: btnclr,
                  minimumSize: Size(250, 53),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Start",
                  style: TextStyle(
                      fontSize: 18, color: Colors.white, letterSpacing: 2.4),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
