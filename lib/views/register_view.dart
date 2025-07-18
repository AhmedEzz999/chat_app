import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:chat_app/helper/custom_snack_bar.dart';
import 'package:chat_app/views/chat_view.dart';
import 'package:chat_app/widgets/header_section.dart';
import 'package:chat_app/widgets/register_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  static const String id = 'register view';
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => SignUpCubit(),
          child: BlocConsumer<SignUpCubit, SignUpState>(
            listener: (context, state) {
              if (state is SignUpSuccess) {
                showCustomSnackBar(context, 'Signed in successfully.');
                Navigator.pushReplacementNamed(context, ChatView.id);
              }
              if (state is SignUpFailed) {
                showCustomSnackBar(context, state.errorMessage);
              }
            },
            builder: (context, state) {
              return const SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                  child: Column(
                    children: [
                      HeaderSection(),
                      SizedBox(height: 50),
                      RegisterSection(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
