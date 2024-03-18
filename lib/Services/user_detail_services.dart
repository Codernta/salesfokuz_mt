

import 'package:salesfokuz_mt/Model/repository_model.dart';
import 'package:salesfokuz_mt/Model/user_detail_model.dart';
import 'package:dio/dio.dart';

class GitHubUserDetailService {
  final Dio _dio = Dio();

  Future<User> fetchUserData(String username) async {
    final response = await _dio.get('https://api.github.com/users/$username');
    if (response.statusCode == 200) {
      return User.fromJson(response.data);
    } else {
      throw Exception('Failed to load user data');
    }
  }

  Future<List<Repository>> fetchRepositories(String username) async {
    final response = await _dio.get('https://api.github.com/users/$username/repos');
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = response.data;
      return jsonData.map((repo) => Repository.fromJson(repo)).toList();
    } else {
      throw Exception('Failed to load repositories');
    }
  }
}