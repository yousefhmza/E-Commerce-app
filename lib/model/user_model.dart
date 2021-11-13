class UserModel {
  final String userId;
  final String email;
  final String name;
  final String pic;

  UserModel({
    required this.userId,
    required this.email,
    required this.name,
    required this.pic,
  });

  factory UserModel.fromJson(var json) {
    return UserModel(
      userId: json["userId"],
      email: json["email"],
      name: json["name"],
      pic: json["pic"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "email": email,
      "name": name,
      "pic": pic,
    };
  }
}
