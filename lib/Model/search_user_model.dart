class UserModel {
  final String login;
  final String avatarUrl;


  UserModel({
    required this.login,
    required this.avatarUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      login: json['login'],
      avatarUrl: json['avatar_url'],
    );
  }
}