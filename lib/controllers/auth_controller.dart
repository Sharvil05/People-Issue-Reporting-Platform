import 'package:flutter/material.dart';
import '../models/user_model.dart';

class AuthController extends ChangeNotifier {
  UserModel? _currentUser;
  bool _isLoading = false;

  UserModel? get currentUser => _currentUser;
  bool get isLoading => _isLoading;

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    // Simulate login delay
    await Future.delayed(const Duration(seconds: 2));

    // Dummy logic for now
    _currentUser = UserModel(
      id: '1',
      name: 'Test User',
      email: email,
      phone: '1234567890',
      role: UserRole.citizen,
    );

    _isLoading = false;
    notifyListeners();
    return true;
  }

  Future<bool> signup({
    required String name,
    required String email,
    required String phone,
    required String password,
    required UserRole role,
  }) async {
    _isLoading = true;
    notifyListeners();

    // Simulate signup delay
    await Future.delayed(const Duration(seconds: 2));

    _currentUser = UserModel(
      id: '2',
      name: name,
      email: email,
      phone: phone,
      role: role,
    );

    _isLoading = false;
    notifyListeners();
    return true;
  }

  Future<void> logout() async {
    _currentUser = null;
    notifyListeners();
  }

  Future<void> sendPasswordResetEmail(String email) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    _isLoading = false;
    notifyListeners();
  }
}
