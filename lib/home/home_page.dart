import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/customs/constant.dart';
import 'package:social_media_app/login/login_provider.dart';
import 'package:social_media_app/posts/post_card.dart';
import 'package:social_media_app/posts/post_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AfterLayoutMixin {
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    context.read<PostProvider>().fetchposts();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<LoginProvider, PostProvider>(
        builder: (context, login, post, _) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: btnclr,
          title: Text("Social Media Ap"),
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
              post.posts.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: post.posts.isEmpty
                          ? Center(child: Text("No posts available"))
                          : ListView.builder(
                              itemCount: post.posts.length,
                              itemBuilder: (context, index) {
                                return PostPage(post: post.posts[index]);
                              },
                            ),
                    ),
            ],
          ),
        ),
      );
    });
  }
}
