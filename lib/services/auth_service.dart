import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthService {
  static Future<void> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  static Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
