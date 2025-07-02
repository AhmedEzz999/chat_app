import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_snack_bar.dart';
import 'package:chat_app/widgets/email_form_field.dart';
import 'package:chat_app/widgets/password_form_field.dart';
import 'package:chat_app/widgets/user_name_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterSection extends StatefulWidget {
  final ValueNotifier<bool> isRegistering;
  const RegisterSection({super.key, required this.isRegistering});

  @override
  State<RegisterSection> createState() => _RegisterSectionState();
}

class _RegisterSectionState extends State<RegisterSection> {
  late final TextEditingController _userNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();

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
    return Form(
      key: _registerFormKey,
      child: Column(
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
            child: UserNameFormField(controller: _userNameController),
          ),

          EmailFormField(controller: _emailController),

          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            child: PasswordFormField(controller: _passwordController),
          ),

          CustomButton(title: 'Sign Up', onPressed: _onRegisterPressed),
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
      ),
    );
  }

  void _onRegisterPressed() async {
    if (_registerFormKey.currentState!.validate()) {
      widget.isRegistering.value = true;
      try {
        await AuthService.registerWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        widget.isRegistering.value = false;
        showCustomSnackBar(context, 'User is created successfully.');
      } on FirebaseAuthException catch (e) {
        widget.isRegistering.value = false;
        late String message;
        switch (e.code) {
          case 'email-already-in-use':
            message = 'The account already exists for that email.';
            break;
          default:
            message = 'There was an error. Try again later.';
        }
        showCustomSnackBar(context, message);
      } catch (e) {
        widget.isRegistering.value = false;
        showCustomSnackBar(context, e.toString());
      }
    }
  }
}
