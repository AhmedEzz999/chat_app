import 'package:chat_app/widgets/header_section.dart';
import 'package:chat_app/widgets/sign_section.dart';
import 'package:chat_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: Column(
              children: [HeaderSection(), SizedBox(height: 50), SignSection()],
            ),
          ),
        ),
      ),
    );
  }
}
