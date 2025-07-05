import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/widgets/message_received.dart';
import 'package:flutter/material.dart';

class MessagesBuilder extends StatelessWidget {
  final List<MessageModel> messages;
  const MessagesBuilder({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      padding: const EdgeInsets.all(0),
      itemCount: messages.length,
      itemBuilder: (context, index) =>
          MessageReceived(message: messages[index].message),
    );
  }
}
