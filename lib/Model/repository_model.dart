
// To parse this JSON data, do
//
//     final repository = repositoryFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Repository> repositoryFromJson(String str) => List<Repository>.from(json.decode(str).map((x) => Repository.fromJson(x)));

String repositoryToJson(List<Repository> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Repository {
  final int id;
  final String nodeId;
  final String name;
  final String fullName;
  final bool private;
  final String htmlUrl;
  final String description;
  final bool fork;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime pushedAt;
  final String cloneUrl;
  final int watchersCount;
  final String language;

  Repository({
    required this.id,
    required this.nodeId,
    required this.name,
    required this.fullName,
    required this.private,
    required this.htmlUrl,
    required this.description,
    required this.fork,
    required this.createdAt,
    required this.updatedAt,
    required this.pushedAt,
    required this.cloneUrl,
    required this.watchersCount,
    required this.language,
  });

  factory Repository.fromJson(Map<String, dynamic> json) => Repository(
    id: json["id"] ?? 0,
    nodeId: json["node_id"] ?? '',
    name: json["name"] ?? '',
    fullName: json["full_name"] ?? '',
    private: json["private"] ?? false,
    htmlUrl: json["html_url"] ?? '',
    description: json["description"]?? '',
    fork: json["fork"] ?? bool,
    createdAt: DateTime.parse(json["created_at"]) ?? DateTime.now(),
    updatedAt: DateTime.parse(json["updated_at"])?? DateTime.now(),
    pushedAt: DateTime.parse(json["pushed_at"]) ?? DateTime.now(),
    cloneUrl: json["clone_url"]?? '',
    watchersCount: json["watchers_count"] ?? 0,
    language: json["language"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "node_id": nodeId,
    "name": name,
    "full_name": fullName,
    "private": private,
    "html_url": htmlUrl,
    "description": description,
    "fork": fork,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "pushed_at": pushedAt.toIso8601String(),
    "clone_url": cloneUrl,
    "watchers_count": watchersCount,
    "language": language,
  };
}
