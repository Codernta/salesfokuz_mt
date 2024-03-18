
import 'package:salesfokuz_mt/Model/search_user_model.dart';
import 'package:dio/dio.dart';

class UserService {
  final Dio _dio = Dio();

  Future<List<UserModel>> searchUsers(String query) async {
    try {
      final response = await _dio.get('https://api.github.com/search/users?q=$query');
      if (response.statusCode == 200) {
        print('**********success***********');
        final List<dynamic> usersData = response.data['items'];
        return usersData.map((userData) => UserModel.fromJson(userData)).toList();
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}