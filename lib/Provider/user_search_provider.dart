

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salesfokuz_mt/Model/search_user_model.dart';
import 'package:salesfokuz_mt/Services/user_search_service.dart';

class UserProvider extends ChangeNotifier {
  List<UserModel> _users = [];
  List<UserModel> get users => _users;
  bool loading = false;

  final UserService _userService = UserService();

  Future<void> searchUsers(String query) async {
    try {
      loading = true;
      _users = await _userService.searchUsers(query);
      loading = false;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}