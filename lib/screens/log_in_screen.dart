import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:os2_project/components/button.dart';
import 'package:os2_project/components/squre_tile.dart';
import 'package:os2_project/components/textfield.dart';

import 'package:os2_project/screens/home_page.dart';
import 'package:os2_project/service/snackbar_service.dart';

class LogInPage extends StatefulWidget {
  final Function()? onTap;
  const LogInPage({super.key, this.onTap});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  SignUserIn() async {
    if (formkey.currentState!.validate()) {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      if (email.isEmpty) {
        SnackBarService.showErrorMessage('Please enter a valid email address');
        return;
      }
      if (password.isEmpty) {
        SnackBarService.showErrorMessage('Please enter a valid password');
        return;
      }
    }

    EasyLoading.show();
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      EasyLoading.dismiss();
      SnackBarService.showSuccessMessage('Successfully signed in');
      // ignore: use_build_context_synchronously
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const Home_Page();
      }));
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      if (e.code == 'user-not-found') {
        SnackBarService.showErrorMessage('No user found for that email');
      } else if (e.code == 'wrong password') {
        SnackBarService.showErrorMessage('Wrong password for that user');
      } else {
        SnackBarService.showErrorMessage('Wrong email or wrong password');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 190, 176, 176),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: formkey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),

                    SizedBox(
                      height: 250,
                      width: 250,
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.red,
                        child: Image.asset('assets/flutflix.png'),
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Welcome back, you\'ve been missed!',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    //username
                    Text_Field(
                      controller: emailController,
                      HintText: 'Email',
                      obsecureText: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //password
                    Text_Field(
                      controller: passwordController,
                      HintText: 'Password',
                      obsecureText: true,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Forget Password?',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    //Sign button
                    MyButton(
                      text: 'Sign In',
                      onTap: SignUserIn,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.white24,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'Or continue with',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.white24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // google apple sign
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SqureTile(
                          imagePath: 'lib/assets/google.png',
                        ),
                        // ignore: unnecessary_const
                        const SizedBox(
                          width: 20,
                        ),
                        SqureTile(
                          imagePath: 'lib/assets/apple.png',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Not a member?',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: const Text(
                            'Rigester now',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Divider(),
                      ],
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
