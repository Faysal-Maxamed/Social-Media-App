import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/customs/constant.dart';
import 'package:social_media_app/login/loginpage.dart';
import 'package:social_media_app/register/register_provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterProvider>(builder: (context, register, _) {
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: gradient),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => register.getImage(),
                  child: Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                      border: register.image == null
                          ? Border.all(color: Colors.grey, width: 2)
                          : null,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: register.image == null
                        ? Center(
                            child: Icon(
                              Icons.person_3_outlined,
                              size: 100,
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.file(
                              register.image!,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
                TextFormField(
                  onChanged: (value) => register.getemail(value),
                  decoration: InputDecoration(
                    hintText: "Email",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (value) => register.getusername(value),
                  decoration: InputDecoration(
                    hintText: "Username",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (value) => register.getpassword(value),
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
                    Text("already have an account"),
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => Loginpage(),
                        ),
                      ),
                      child: Text("Sign in"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () => register.register(context),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(300, 60),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      backgroundColor: Color(0xff5E35B1),
                      foregroundColor: Colors.white),
                  child: Text(
                    "Register",
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
