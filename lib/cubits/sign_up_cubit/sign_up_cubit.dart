import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  void onRegisterPressed({
    required String email,
    required String password,
    required GlobalKey<FormState> key,
  }) async {
    if (key.currentState!.validate()) {
      emit(SignUpLoading());
      try {
        await AuthService.registerWithEmailAndPassword(
          email: email,
          password: password,
        );
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(kUserId, email);
        emit(SignUpSuccess());
      } on FirebaseAuthException catch (e) {
        late String message;
        switch (e.code) {
          case 'email-already-in-use':
            message = 'The account already exists for that email.';
            break;
          default:
            message = 'There was an error. Try again later.';
        }
        emit(SignUpFailed(errorMessage: message));
      } catch (e) {
        emit(SignUpFailed(errorMessage: e.toString()));
      }
    }
  }
}
