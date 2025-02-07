import 'package:flutter/material.dart';
import 'package:social_media_app/posts/post_model.dart';
import 'package:jiffy/jiffy.dart';

class PostPage extends StatelessWidget {
  PostPage({super.key, required this.post});
  final PostModel post;

  
  @override
  // var time = Jiffy(post.createdDate).fromNow();
  Widget build(BuildContext context) {
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
                backgroundImage: NetworkImage(post.photo!),
              ),
              title: Text(post.name!),
              subtitle: Text(""),
              trailing: Icon(Icons.more_vert),
            ),
            Text(post.body!),
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
  }
}
