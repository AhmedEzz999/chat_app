import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  final TextEditingController controller;
  const PasswordFormField({super.key, required this.controller});

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) =>
          value == null || value.isEmpty ? 'This field is required' : null,
      controller: widget.controller,
      obscureText: _obscureText,
      style: const TextStyle(fontSize: 23, color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Password',
        hintStyle: const TextStyle(fontSize: 23, color: Colors.white),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
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
