import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:os2_project/components/button.dart';
import 'package:os2_project/components/squre_tile.dart';
import 'package:os2_project/components/textfield.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  void SignUserUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      if (passwordController.text == confirmpasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
      } else {
        showErrorMessage('Passwords don\'t match!');
      }
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.black,
            title: Center(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 190, 176, 176),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                'Let\'s create an account!',
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

              //confirm password
              Text_Field(
                controller: confirmpasswordController,
                HintText: 'Confirm Password',
                obsecureText: true,
              ),
              const SizedBox(
                height: 10,
              ),

              const SizedBox(
                height: 25,
              ),
              //Sign button
              MyButton(
                text: 'Sign Up',
                onTap: SignUserUp,
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
                        style: TextStyle(color: Colors.white, fontSize: 14),
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
                    'Already have an account?',
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
                      'Login now',
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
    );
  }
}
