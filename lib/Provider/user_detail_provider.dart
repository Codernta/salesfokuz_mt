

import 'package:flutter/material.dart';
import 'package:salesfokuz_mt/Model/repository_model.dart';
import 'package:salesfokuz_mt/Model/user_detail_model.dart';
import 'package:salesfokuz_mt/Services/user_detail_services.dart';

class GitHubProfileProvider extends ChangeNotifier {
  final GitHubUserDetailService _gitHubService = GitHubUserDetailService();
  User? _user;
  List<Repository>? _repositories;

  User? get user => _user;
  List<Repository>? get repositories => _repositories;

  bool loadingUser = false;
  bool loadingRepo = false;

  Future<void> fetchUserData(String username) async {
    loadingUser = true;
    _user = await _gitHubService.fetchUserData(username);
    loadingUser = false;
    notifyListeners();
  }

  Future<void> fetchRepositories(String username) async {
    loadingRepo = true;
    _repositories = await _gitHubService.fetchRepositories(username);
    loadingRepo = false;
    notifyListeners();
  }
}