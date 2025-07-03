import 'package:chat_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MessageSent extends StatelessWidget {
  const MessageSent({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: AppColors.kSecondaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: const Text(
          'I\'m Great.',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
