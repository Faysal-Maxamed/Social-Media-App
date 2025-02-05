import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/customs/constant.dart';
import 'package:social_media_app/login/login_provider.dart';
import 'package:social_media_app/register/register_page.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context, login, _) {
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: gradient),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  child: Icon(
                    Icons.person_4_rounded,
                    size: 100,
                  ),
                ),
                TextFormField(
                  onChanged: (value) =>
                      context.read<LoginProvider>().getusername(value),
                  decoration: InputDecoration(
                    hintText: "Username",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (value) =>
                      context.read<LoginProvider>().getpassword(value),
                  decoration: InputDecoration(
                    hintText: "Password",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Dont have an account ?"),
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => RegisterPage(),
                        ),
                      ),
                      child: Text("Sign up"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () => context.read<LoginProvider>().login(context),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(300, 60),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      backgroundColor: Color(0xff5E35B1),
                      foregroundColor: Colors.white),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
