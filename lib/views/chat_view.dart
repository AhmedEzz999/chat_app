import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/services/get_messages_list.dart';
import 'package:chat_app/widgets/logout_button.dart';
import 'package:chat_app/widgets/message_text_field.dart';
import 'package:chat_app/widgets/messages_builder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  static const String id = 'chat view';
  ChatView({super.key});

  final Stream<QuerySnapshot> _messageStream = FirebaseFirestore.instance
      .collection(kMessageCollection)
      .orderBy(kCreatedAt, descending: true)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 70),
            Image(image: AssetImage(AppImages.kScholarImage), height: 70),
            Text(
              'Chat',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: const [LogoutButton()],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _messageStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Column(
                children: [
                  Expanded(
                    child: MessagesBuilder(
                      messages: getMessagesList(snapshot.data!),
                    ),
                  ),
                  const MessageTextField(),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text(
                'There is an error. Try again later.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40),
              ),
            );
          }
        },
      ),
    );
  }
}
