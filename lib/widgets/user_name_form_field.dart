import 'package:flutter/material.dart';

class UserNameFormField extends StatelessWidget {
  final TextEditingController controller;

  const UserNameFormField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Username is required';
        } else if (value.length < 3) {
          return 'Username must be at least 3 characters';
        } else if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
          return 'Username can only contain letters, numbers, and underscores';
        }
        return null;
      },
      controller: controller,
      style: const TextStyle(fontSize: 23, color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Username',
        hintStyle: const TextStyle(fontSize: 23, color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
