import 'package:chat_app/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessageTextField extends StatefulWidget {
  final String idAccount;
  const MessageTextField({super.key, required this.idAccount});

  @override
  State<MessageTextField> createState() => _MessageTextFieldState();
}

class _MessageTextFieldState extends State<MessageTextField> {
  late final TextEditingController _messageController;
  final CollectionReference _messages = FirebaseFirestore.instance.collection(
    kMessageCollection,
  );

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40, top: 10),
      child: TextField(
        keyboardType: TextInputType.text,
        controller: _messageController,
        onSubmitted: (message) {
          if (message.isNotEmpty) {
            _messages.add({
              kMessageText: message,
              kCreatedAt: DateTime.now(),
              kUserId: widget.idAccount,
            });
            _messageController.clear();
          }
        },
        minLines: 1,
        maxLines: 3,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              final String message = _messageController.text;
              if (message.isNotEmpty) {
                _messages.add({
                  kMessageText: message,
                  kCreatedAt: DateTime.now(),
                  kUserId: widget.idAccount,
                });
                _messageController.clear();
              }
            },
            icon: const Icon(Icons.send, color: AppColors.kPrimaryColor),
          ),
          hintText: 'Enter Your Message',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.green, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.blueAccent, width: 1.5),
          ),
        ),
      ),
    );
  }
}
