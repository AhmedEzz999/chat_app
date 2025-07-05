import 'package:chat_app/constants/constants.dart';
import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Image(
          image: AssetImage(AppImages.kScholarImage),
          fit: BoxFit.cover,
          height: 150,
          width: 150,
        ),
        Text(
          'Scholar Chat',
          style: TextStyle(
            fontSize: 45,
            fontFamily: 'Pacifico',
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
