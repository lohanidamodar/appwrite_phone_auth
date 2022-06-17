import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';

class AuthState extends ChangeNotifier {
  static ChangeNotifierProvider provider => _changeNotifierProvider;
  bool isLoggedIn = false;
  final _client = Client();
  late final Account _account;
  String _error = '';

  String get error => _error;

  AuthState() {
    _account = Account(_client);
  }

  createSession(String phone) async {
    try {
      await _account.createPhoneSession(userId: 'unique()', number: phone);
    } on AppwriteException catch (e) {
      _error = e.message ?? e.toString();
    }
  }

  confirmSession(String userId, String secret) async {
    try {
      await _account.updatePhoneSession(userId: userId, secret: secret);
    } on AppwriteException catch (e) {
      _error = e.message ?? e.toString();
    }
  }
}

final _authStateProvider = ChangeNotifierProvider<AuthState>((ref) => AuthState());