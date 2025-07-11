import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/helper/custom_snack_bar.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/views/chat_view.dart';
import 'package:chat_app/views/register_view.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/email_form_field.dart';
import 'package:chat_app/widgets/login_icon.dart';
import 'package:chat_app/widgets/password_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInSection extends StatefulWidget {
  final ValueNotifier<bool> isSigning;
  const SignInSection({super.key, required this.isSigning});

  @override
  State<SignInSection> createState() => _SignInSectionState();
}

class _SignInSectionState extends State<SignInSection> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final GlobalKey<FormState> _signInFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signInFormKey,
      child: Column(
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
            child: EmailFormField(controller: _emailController),
          ),

          PasswordFormField(controller: _passwordController),

          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: CustomButton(title: 'Sign In', onPressed: _onSigningPressed),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              LoginIcon(imageSource: AppImages.kGoogleLogo, onPressed: () {}),
              LoginIcon(imageSource: AppImages.kFacebookLogo, onPressed: () {}),
              LoginIcon(imageSource: AppImages.kAppleLogo, onPressed: () {}),
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
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, RegisterView.id),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onSigningPressed() async {
    if (_signInFormKey.currentState!.validate()) {
      widget.isSigning.value = true;
      try {
        await AuthService.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        await saveUserId(_emailController.text);
        showCustomSnackBar(context, 'Signed in successfully.');
        Navigator.pushReplacementNamed(context, ChatView.id);
      } on FirebaseAuthException catch (e) {
        late String message;
        switch (e.code) {
          case 'invalid-credential':
            message = 'Invalid email or password';
            break;
          case 'too-many-requests':
            message = 'Too many login attempts. Try again later.';
            break;
          default:
            message = 'Authentication failed: ${e.message}';
        }
        showCustomSnackBar(context, message);
      } catch (e) {
        showCustomSnackBar(context, e.toString());
      }
      widget.isSigning.value = false;
    }
  }
}

Future<void> saveUserId(String userId) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(kUserId, userId);
}
