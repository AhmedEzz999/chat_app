import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:chat_app/widgets/password_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterSection extends StatefulWidget {
  const RegisterSection({super.key});

  @override
  State<RegisterSection> createState() => _RegisterSectionState();
}

class _RegisterSectionState extends State<RegisterSection> {
  late final TextEditingController _userNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _userNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _userNameController.dispose();
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
            'Register',
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: CustomTextField(
            hintText: 'Username',
            controller: _userNameController,
          ),
        ),

        CustomTextField(hintText: 'Email', controller: _emailController),

        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          child: PasswordTextField(controller: _passwordController),
        ),

        CustomButton(
          title: 'Sign Up',
          onPressed: () async {
            try {
              final credential = await FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
              Navigator.pushReplacementNamed(context, 'home view');
            } on FirebaseAuthException catch (e) {
              if (e.code == 'weak-password') {
                print('The password provided is too weak.');
              } else if (e.code == 'email-already-in-use') {
                print('The account already exists for that email.');
              }
            } catch (e) {
              print(e);
            }
          },
        ),
        const SizedBox(height: 10),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Already have an account?",
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 10),
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Sign In',
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
