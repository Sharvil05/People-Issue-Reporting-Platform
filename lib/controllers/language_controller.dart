import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/language.dart';

class LanguageController extends ChangeNotifier {
  String _selectedLanguageCode = 'en';
  bool _isLoading = true;

  String get selectedLanguageCode => _selectedLanguageCode;
  bool get isLoading => _isLoading;

  final List<Language> languages = [
    Language(name: 'English', code: 'en'),
    Language(name: 'Hindi', code: 'hi'),
    Language(name: 'Marathi', code: 'mr'),
  ];

  LanguageController() {
    _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    _selectedLanguageCode = prefs.getString('language_code') ?? 'en';
    _isLoading = false;
    notifyListeners();
  }

  Future<void> setLanguage(String code) async {
    _selectedLanguageCode = code;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', code);
    notifyListeners();
  }
}
