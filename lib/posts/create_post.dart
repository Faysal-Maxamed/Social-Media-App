import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/posts/post_provider.dart';

class CreatePost extends StatelessWidget {
  const CreatePost({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PostProvider>(builder: (context, post, _) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          centerTitle: true,
          title: Text("Create Post"),
          shadowColor: Colors.cyan,
          elevation: 10,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Container(
                child: TextField(
                  onChanged: (value) =>
                      context.read<PostProvider>().getbodttext(value),
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: "Write what you think",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(300, 60),
                ),
                onPressed: () => context.read<PostProvider>().addpost(context),
                child: Text("Submit"),
              )
            ],
          ),
        ),
      );
    });
  }
}
