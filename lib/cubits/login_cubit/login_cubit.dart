import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void onSigningPressed({
    required String email,
    required String password,
    required GlobalKey<FormState> key,
  }) async {
    if (key.currentState!.validate()) {
      emit(LoginLoading());
      try {
        await AuthService.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(kUserId, email);
        emit(LoginSuccess());
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
        emit(LoginFailed(errorMessage: message));
      } catch (e) {
        emit(LoginFailed(errorMessage: e.toString()));
      }
    }
  }
}
