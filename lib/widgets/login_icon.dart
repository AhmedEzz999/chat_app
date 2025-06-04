import 'package:flutter/material.dart';

class LoginIcon extends StatelessWidget {
  final String imageSource;
  final void Function() onPressed;
  const LoginIcon({
    super.key,
    required this.imageSource,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: IconButton.styleFrom(
        padding: const EdgeInsets.all(5),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      onPressed: onPressed,
      child: Image.asset(imageSource, width: 50, height: 50),
    );
  }
}
