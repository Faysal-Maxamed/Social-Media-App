class LoginModel {
  String id;
  String username;
  String email;
  String image;

  LoginModel({
    required this.id,
    required this.username,
    required this.email,
    required this.image,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      image: json['image'],
    );
  }

   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['username'] = username;
    data['email'] =email;
    data['image'] =image;
    return data;
  }
}
