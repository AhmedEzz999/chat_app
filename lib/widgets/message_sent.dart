import 'package:chat_app/constants/constants.dart';
import 'package:flutter/material.dart';

class MessageSent extends StatelessWidget {
  final String message;
  const MessageSent({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(bottom: 15),
        decoration: const BoxDecoration(
          color: AppColors.kSecondaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: Text(
          message,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
