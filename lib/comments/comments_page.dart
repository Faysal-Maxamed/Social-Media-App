import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/comments/comment_provider.dart';
import 'package:social_media_app/posts/post_model.dart';
import 'package:social_media_app/posts/post_provider.dart';

class CommentsPage extends StatelessWidget {
  CommentsPage({super.key, required this.post});
  PostModel post;
  @override
  TextEditingController Textedit = TextEditingController();
  Widget build(BuildContext context) {
    return Consumer<PostProvider>(builder: (context, postpro, _) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          centerTitle: true,
          title: Text("Comments"),
          shadowColor: Colors.cyan,
          elevation: 10,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: post.comments!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 15),
                      margin: EdgeInsets.only(top: 10),
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 7,
                            offset: Offset(3, 7),
                          ),
                        ],
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(post.comments![index].text!),
                    );
                  },
                ),
              ),
              TextField(
                controller: Textedit,
                onChanged: (value) =>
                    context.read<CommentProvider>().getcomentText(value),
                decoration: InputDecoration(
                  hintText: "Write Comment",
                  suffixIcon: IconButton(
                    onPressed: () {
                      Textedit.clear();
                      FocusScope.of(context).requestFocus(FocusScopeNode());
                      post.comments!.add(
                        Comments(
                            text: context.read<CommentProvider>().commenText),
                      );
                      context.read<CommentProvider>().addcomment(post.sId!,context);
                      context.read<PostProvider>().fetchposts();
                    },
                    icon: Icon(Icons.send),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
