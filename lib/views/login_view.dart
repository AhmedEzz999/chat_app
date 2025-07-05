import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/widgets/header_section.dart';
import 'package:chat_app/widgets/sign_in_section.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginView extends StatefulWidget {
  static const String id = 'login view';
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final ValueNotifier<bool> isSigning = ValueNotifier(false);

  @override
  void dispose() {
    isSigning.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isSigning,
      builder: (context, loading, _) {
        return ModalProgressHUD(
          inAsyncCall: loading,
          child: Scaffold(
            backgroundColor: AppColors.kPrimaryColor,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 30,
                  ),
                  child: Column(
                    children: [
                      const HeaderSection(),
                      const SizedBox(height: 50),
                      SignInSection(isSigning: isSigning),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
