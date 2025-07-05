import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/widgets/message_received.dart';
import 'package:chat_app/widgets/message_sent.dart';
import 'package:flutter/material.dart';

class MessagesBuilder extends StatelessWidget {
  final List<MessageModel> messages;
  final String idAccount;
  const MessagesBuilder({
    super.key,
    required this.messages,
    required this.idAccount,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      padding: const EdgeInsets.all(0),
      itemCount: messages.length,
      itemBuilder: (context, index) => messages[index].id == idAccount
          ? MessageSent(message: messages[index].message)
          : MessageReceived(message: messages[index].message),
    );
  }
}
