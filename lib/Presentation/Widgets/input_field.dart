import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;

  const InputField({
    super.key,
    required this.controller,
    required this.label,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(),
        labelText: label,
      ),
    );
  }
}
