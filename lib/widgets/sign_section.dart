import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:chat_app/widgets/login_icon.dart';
import 'package:chat_app/widgets/password_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignSection extends StatefulWidget {
  const SignSection({super.key});

  @override
  State<SignSection> createState() => _SignSectionState();
}

class _SignSectionState extends State<SignSection> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          width: double.infinity,
          child: Text(
            textAlign: TextAlign.left,
            'Sign In',
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: CustomTextField(
            hintText: 'Email',
            controller: _emailController,
          ),
        ),

        PasswordTextField(controller: _passwordController),

        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: CustomButton(
            title: 'Sign In',
            onPressed: () async {
              try {
                final credential = await FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                Navigator.pushReplacementNamed(context, 'home view');
              } on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found') {
                  print('No user found for that email.');
                } else if (e.code == 'wrong-password') {
                  print('Wrong password provided for that user.');
                }
              }
            },
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            LoginIcon(
              imageSource: 'assets/images/google_logo.png',
              onPressed: () {},
            ),
            LoginIcon(
              imageSource: 'assets/images/facebook_logo.png',
              onPressed: () {},
            ),
            LoginIcon(
              imageSource: 'assets/images/apple_logo.png',
              onPressed: () {},
            ),
          ],
        ),

        const SizedBox(height: 10),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don't have an account?",
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 10),
              ),
              onPressed: () => Navigator.pushNamed(context, 'register view'),
              child: const Text(
                'Sign Up',
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
