import 'package:flutter/material.dart';

class Utils {
  /// Validates email and password, returns error message if invalid
  static String? validateLogin(String email, String password) {
    if (email.trim().isEmpty || password.trim().isEmpty) {
      return 'Email and password cannot be empty';
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
    );
    if (!emailRegex.hasMatch(email.trim())) {
      return 'Enter a valid email address';
    }

    return null; // Validation passed
  }

  /// Shows a SnackBar notification
  static void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
