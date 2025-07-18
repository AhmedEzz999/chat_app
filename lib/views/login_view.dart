import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/cubits/login_cubit/login_cubit.dart';
import 'package:chat_app/helper/custom_snack_bar.dart';
import 'package:chat_app/views/chat_view.dart';
import 'package:chat_app/widgets/header_section.dart';
import 'package:chat_app/widgets/sign_in_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  static const String id = 'login view';
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => LoginCubit(),
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                showCustomSnackBar(context, 'Signed in successfully.');
                Navigator.pushReplacementNamed(context, ChatView.id);
              }
              if (state is LoginFailed) {
                showCustomSnackBar(context, state.errorMessage);
              }
            },
            builder: (context, state) {
              if (state is LoginLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is LoginInitial || state is LoginFailed) {
                return const SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                    child: Column(
                      children: [
                        HeaderSection(),
                        SizedBox(height: 50),
                        SignInSection(),
                      ],
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
