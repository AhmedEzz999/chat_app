import 'package:flutter/material.dart';

class EmailFormField extends StatelessWidget {
  final TextEditingController controller;

  const EmailFormField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) =>
          value == null || value.isEmpty ? 'This field is required' : null,
      controller: controller,
      style: const TextStyle(fontSize: 23, color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Email',
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
