import 'package:chat_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MessageReceived extends StatelessWidget {
  const MessageReceived({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: AppColors.kPrimaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: const Text(
          'How are you?',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
