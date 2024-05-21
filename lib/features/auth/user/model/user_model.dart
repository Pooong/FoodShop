class UserModel {
  final String uid;
  // final String password;
  final String email;
  String? displayName;
  String? photoUrl;
  String? createdAt;

  UserModel({
    required this.uid,
    // required this.password,
    required this.email,
    this.displayName,
    this.photoUrl,
    this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      // password: json['password'],
      email: json['email'],
      displayName: json['displayName'],
      photoUrl: json['photoUrl'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      // 'password': password,
      'email': email,
      'displayName': displayName,
      'photoUrl': photoUrl,
      'createdAt': createdAt,
    };
  }
}
