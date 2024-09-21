import 'package:flutter/material.dart';
import 'package:os2_project/screens/log_in_screen.dart';
import 'package:os2_project/screens/register_page.dart';

class LogInOrRegisterPage extends StatefulWidget {
  const LogInOrRegisterPage({super.key});

  @override
  State<LogInOrRegisterPage> createState() => _LogInOrRegisterPageState();
}

class _LogInOrRegisterPageState extends State<LogInOrRegisterPage> {
  bool showLogInPage = true;
  void togglePages() {
    setState(() {
      showLogInPage = !showLogInPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogInPage) {
      return LogInPage(
        onTap: togglePages,
      );
    } else {
      return RegisterPage(
        onTap: togglePages,
      );
    }
  }
}
