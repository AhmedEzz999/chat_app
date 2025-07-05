import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/widgets/header_section.dart';
import 'package:chat_app/widgets/register_section.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterView extends StatefulWidget {
  static const String id = 'register view';
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final ValueNotifier<bool> isRegistering = ValueNotifier(false);

  @override
  void dispose() {
    isRegistering.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isRegistering,
      builder: (context, loading, _) => ModalProgressHUD(
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
                    RegisterSection(isRegistering: isRegistering),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
