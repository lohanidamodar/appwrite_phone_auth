import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthState extends ChangeNotifier {
  static ChangeNotifierProvider<AuthState> get provider => _authStateProvider;
  bool isLoggedIn = false;
  final _client = Client();
  late final Account _account;
  String _error = '';
  String userId = '';
  User? user;

  String get error => _error;

  AuthState() {
    _client
        .setEndpoint(
            'https://8080-appwrite-appwrite-1x1akoyvw55.ws-us47.gitpod.io/v1')
        .setProject('projectx');
    _account = Account(_client);
    getAccount();
  }

  Future<bool> getAccount() async {
    try {
      user = await _account.get();
      isLoggedIn = true;
      notifyListeners();
      return true;
    } on AppwriteException catch (e) {
      _error = e.message ?? e.toString();
      isLoggedIn = false;
      user = null;
      notifyListeners();
      return false;
    }
  }

  Future<bool> createSession(String phone) async {
    try {
      final token =
          await _account.createPhoneSession(userId: 'unique()', number: phone);
      userId = token.userId;
      return true;
    } on AppwriteException catch (e) {
      _error = e.message ?? e.toString();
      isLoggedIn = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> confirmSession(String secret) async {
    if (userId.isEmpty) {
      _error = 'userId not known, call `createSession` first to get userId';
      notifyListeners();
      return false;
    }
    try {
      await _account.updatePhoneSession(userId: userId, secret: secret);
      isLoggedIn = true;
      notifyListeners();
      return true;
    } on AppwriteException catch (e) {
      _error = e.message ?? e.toString();
      isLoggedIn = false;
      return false;
    }
  }
}

final _authStateProvider =
    ChangeNotifierProvider<AuthState>((ref) => AuthState());
