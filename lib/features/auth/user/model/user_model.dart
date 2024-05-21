class UserModel {
  final String uid;
  // final String password;
  final String email;
  String? displayName;
  String? photoUrl;
  String? createdAt;
  bool? isComplete;
  UserModel({
    required this.uid,
    // required this.password,
    required this.email,
    this.displayName,
    this.photoUrl,
    this.createdAt,
    this.isComplete,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      // password: json['password'],
      email: json['email'],
      displayName: json['displayName'],
      photoUrl: json['photoUrl'],
      createdAt: json['createdAt'],
      isComplete: json['isComplete'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      // 'password': password,
      'email': email,
      'isComplete': isComplete,
      'displayName': displayName,
      'photoUrl': photoUrl,
      'createdAt': createdAt,
    };
  }
}
