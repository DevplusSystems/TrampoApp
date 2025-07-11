
import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;
  String? _successMessage;

  // Getter for isLoading
  bool get isLoading => _isLoading;

  // Setter for isLoading
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Getter for errorMessage
  String? get errorMessage => _errorMessage;

  // Setter for errorMessage
  set errorMessage(String? value) {
    _errorMessage = value;
    notifyListeners();
  }

  // Getter for successMessage
  String? get successMessage => _successMessage;

  // Setter for successMessage
  set successMessage(String? value) {
    _successMessage = value;
    notifyListeners();
  }

  // Method to clear messages and notify listeners
  void clearMessages() {
    _errorMessage = null;
    _successMessage = null;
    notifyListeners();
  }
}
