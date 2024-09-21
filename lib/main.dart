import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:os2_project/screens/auth_logic.dart';

import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Flutflix());
}

class Flutflix extends StatelessWidget {
  const Flutflix({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(
        builder: BotToastInit(),
      ),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF23272E),
      ),
      home: const AuthPage(),
    );
  }
}
