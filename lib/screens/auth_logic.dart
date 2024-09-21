import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:os2_project/screens/home_page.dart';
import 'package:os2_project/screens/log_in_or_register_logic.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const Home_Page();
        } else {
          return const LogInOrRegisterPage();
        }
      },
    );
  }
}
