
import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  final String login;
  final int id;
  final String avatarUrl;
  final String type;
  final String name;
  final String location;
  final String bio;
  final String twitterUsername;
  final int publicRepos;
  final int followers;
  final int following;

  User({
    required this.login,
    required this.id,
    required this.avatarUrl,
    required this.type,
    required this.name,
    required this.location,
    required this.bio,
    required this.twitterUsername,
    required this.publicRepos,
    required this.followers,
    required this.following,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    login: json["login"] ?? '',
    id: json["id"] ?? 0,
    avatarUrl: json["avatar_url"]?? "",
    type: json["type"] ?? '',
    name: json["name"] ?? '',
    location: json["location"] ?? '',
    bio: json["bio"] ?? '',
    twitterUsername: json["twitter_username"] ?? '',
    publicRepos: json["public_repos"] ?? 0,
    followers: json["followers"] ?? 0,
    following: json["following"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "login": login,
    "id": id,
    "avatar_url": avatarUrl,
    "type": type,
    "name": name,
    "location": location,
    "bio": bio,
    "twitter_username": twitterUsername,
    "public_repos": publicRepos,
    "followers": followers,
    "following": following,
  };
}
