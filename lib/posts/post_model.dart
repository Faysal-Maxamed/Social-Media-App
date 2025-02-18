import 'dart:io';

class PostModel {
  String? sId;
  String? body;
  List<String>? images;
  String? name;
  String? photo;
  List<Likes>? likes;
  List<Comments>? comments;
  String? createdDate;
  int? iV;

  PostModel(
      {this.sId,
      this.body,
      this.images,
      this.name,
      this.photo,
      this.likes,
      this.comments,
      this.createdDate,
      this.iV});

  PostModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    body = json['body'];
    images = json['images'].cast<String>();
    name = json['name'];
    photo = json['photo'];
    if (json['likes'] != null) {
      likes = <Likes>[];
      json['likes'].forEach((v) {
        likes!.add(new Likes.fromJson(v));
      });
    }
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }
    createdDate = json['createdDate'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['body'] = this.body;
    data['images'] = this.images;
    data['name'] = this.name;
    data['photo'] = this.photo;
    if (this.likes != null) {
      data['likes'] = this.likes!.map((v) => v.toJson()).toList();
    }
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    data['createdDate'] = this.createdDate;
    data['__v'] = this.iV;
    return data;
  }
}

class Likes {
  String? type;
  String? createdDate;
  String? name;
  String? photo;
  String? sId;

  Likes({this.type, this.createdDate, this.name, this.photo, this.sId});

  Likes.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    createdDate = json['createdDate'];
    name = json['name'];
    photo = json['photo'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['createdDate'] = this.createdDate;
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['_id'] = this.sId;
    return data;
  }
}

class Comments {
  String? text;
  String? name;
  String? sId;
  String? createdDate;

  Comments({this.text, this.name, this.sId, this.createdDate});

  Comments.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    name = json['name'];
    sId = json['_id'];
    createdDate = json['createdDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['name'] = this.name;
    data['_id'] = this.sId;
    data['createdDate'] = this.createdDate;
    return data;
  }
}
