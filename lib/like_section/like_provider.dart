import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:social_media_app/customs/constant.dart';
import 'package:social_media_app/posts/post_model.dart';

class LikeProvider extends ChangeNotifier {
  List<Likes> likes = [];

  Future<void> fetchLikes(String postId) async {
    try {
      final response =
          await http.get(Uri.parse('$endpoint/post/$postId/likes'));
      if (response.statusCode == 200) {
        List decodedData = jsonDecode(response.body);
        likes = decodedData.map((e) => Likes.fromJson(e)).toList();
        notifyListeners();
      }
    } catch (e) {
      print('Error fetching likes: $e');
    }
  }

  Future<void> addLike(
    String postId,
    String username,
  ) async {
    try {
      final response = await http.put(
        Uri.parse(endpoint + "post/$postId/like"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "username": username,
        }),
      );
      if (response.statusCode == 201) {
        fetchLikes(postId);
      } else {
        print(response.body);
      }
    } catch (e) {
      print('Error adding like: $e');
    }
  }
}
