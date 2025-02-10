import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/comments/comments_page.dart';
import 'package:social_media_app/customs/constant.dart';
import 'package:social_media_app/login/login_provider.dart';
import 'package:social_media_app/posts/post_model.dart';
import 'package:social_media_app/posts/post_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AfterLayoutMixin {
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    Provider.of<PostProvider>(context, listen: false).fetchposts();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<LoginProvider, PostProvider>(
        builder: (context, login, post, _) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          centerTitle: true,
          title: Text("Social Media"),
          shadowColor: Colors.cyan,
          elevation: 10,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(login.user!.image),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "what is your mine?",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: post.lisofposts.length,
                  itemBuilder: (_, index) {
                    var time = Jiffy.parseFromDateTime(
                            DateTime.parse(post.lisofposts[index].createdDate!))
                        .fromNow();

                    return Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                                backgroundImage: AssetImage("images/1.png"),
                              ),
                              title: Text(post.lisofposts[index].name!),
                              subtitle: Text(time),
                              trailing: Icon(Icons.more_vert),
                            ),
                            Text(post.lisofposts[index].body!),
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
                                GestureDetector(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => CommentsPage(
                                        post: post.lisofposts[index],
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.comment,
                                        color: Colors.blue,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text("comment"),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
