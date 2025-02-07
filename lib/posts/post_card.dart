import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/login/login_provider.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context, login, _) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              offset: Offset(2, 6),
              color: Colors.grey.shade300,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(login.user!.image),
                ),
                title: Text(login.user!.username),
                subtitle: Text("2hr ago"),
                trailing: Icon(Icons.more_vert),
              ),
              Text("waxaan soo wadnaa social media App"),
              Visibility(
                child: Center(
                  child: Container(
                    child: Image.asset(
                      "images/1.png",
                      height: 200,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.thumb_up,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text("Like"),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.comment,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("comment"),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
