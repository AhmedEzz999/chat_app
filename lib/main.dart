import 'package:chat_app/views/home_view.dart';
import 'package:chat_app/views/login_view.dart';
import 'package:chat_app/views/register_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ChatApp());
}

class ChatApp extends StatefulWidget {
  const ChatApp({super.key});

  @override
  State<ChatApp> createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'login view': (context) => const LoginView(),
        'register view': (context) => const RegisterView(),
        'home view': (context) => const HomeView(),
      },
      initialRoute: 'login view',
    );
  }
}
