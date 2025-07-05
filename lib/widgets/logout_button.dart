import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        await AuthService.signOut();
        await removeUserId();
        Navigator.pushNamedAndRemoveUntil(
          context,
          LoginView.id,
          (route) => false,
        );
      },
      icon: const Padding(
        padding: EdgeInsets.only(right: 20),
        child: Icon(Icons.logout, size: 30, color: Colors.white),
      ),
    );
  }
}

Future<void> removeUserId() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove(kUserId);
}
