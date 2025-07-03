import 'package:chat_app/theme/app_colors.dart';
import 'package:chat_app/widgets/logout_button.dart';
import 'package:chat_app/widgets/message_received.dart';
import 'package:chat_app/widgets/message_sent.dart';
import 'package:chat_app/widgets/message_text_field.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 5,
          children: [
            SizedBox(width: 40),
            Image(image: AssetImage('assets/images/scholar.png'), height: 70),
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
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: const [MessageReceived(), MessageSent()],
              ),
            ),
            const MessageTextField(),
          ],
        ),
      ),
    );
  }
}
