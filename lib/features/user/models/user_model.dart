class UserModel {
  final String name;
  final String email;
  final String uid;

  UserModel({
    required this.name,
    required this.email,
    required this.uid,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "uid": uid,
      "email": email,
    };
  }

  UserModel.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        uid = json["uid"],
        email = json["email"];

  UserModel.empty()
      : name = "",
        uid = "",
        email = "";

  UserModel copyWith({
    String? name,
    String? email,
    String? uid,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      uid: uid ?? this.uid,
    );
  }
}
