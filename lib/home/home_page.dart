import 'dart:async';
import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/comments/comments_page.dart';
import 'package:social_media_app/like_section/like_provider.dart';
import 'package:social_media_app/login/login_provider.dart';
import 'package:social_media_app/posts/create_post.dart';
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
    return Consumer3<LoginProvider, PostProvider, LikeProvider>(
      builder: (context, login, post, Like, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Social Media",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            centerTitle: true,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.cyan, Colors.blueAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            elevation: 6,
            shadowColor: Colors.cyan.shade200,
            foregroundColor: Colors.white,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              children: [
                // User Info Row
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(login.user!.image),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      login.user!.username,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Posts List
                Expanded(
                  child: post.isloading
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: post.lisofposts.length,
                          itemBuilder: (_, index) {
                            var postItem = post.lisofposts[index];
                            var time = Jiffy.parseFromDateTime(
                                    DateTime.parse(postItem.createdDate!))
                                .fromNow();

                            return Card(
                              elevation: 4,
                              margin: const EdgeInsets.only(bottom: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Post Header
                                    ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      leading: CircleAvatar(
                                        backgroundImage:
                                            NetworkImage(login.user!.image),
                                        radius: 25,
                                      ),
                                      title: Text(
                                        postItem.name!,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      subtitle: Text(
                                        time,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                      trailing: const Icon(Icons.more_vert),
                                    ),

                                    // Post Body
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Text(
                                        postItem.body!,
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ),

                                    // Like & Comment Row
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Like.addLike(
                                              post.lisofposts[index].sId!,
                                              login.user!.username,
                                            );
                                          },
                                          child: Row(
                                            children: const [
                                              Icon(Icons.thumb_up,
                                                  color: Colors.blue),
                                              SizedBox(width: 5),
                                              Text("Like"),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        GestureDetector(
                                          onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => CommentsPage(
                                                  post: post.lisofposts[index]),
                                            ),
                                          ),
                                          child: Row(
                                            children: const [
                                              Icon(Icons.comment,
                                                  color: Colors.blue),
                                              SizedBox(width: 5),
                                              Text("Comment"),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),

          // Add Post Floating Button
          floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CreatePost()),
            ),
            backgroundColor: Colors.cyan,
            child: const Icon(Icons.add, color: Colors.white),
          ),
        );
      },
    );
  }
}
