import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortune_room_booking_app/config/constants.dart';
import 'package:fortune_room_booking_app/pages/home/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/constants.dart';
import '../card_verification.dart';

class SignInForm extends StatefulWidget {
  SignInForm({
    super.key,
    required this.devSize,
  });

  final Size devSize;

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              icon: Icon(Icons.email),
              labelText: 'Email',
              helperText: 'Please enter a Valid Email',
            ),
          ),
          TextFormField(
            controller: passwordController,
            decoration: const InputDecoration(
              icon: Icon(Icons.lock),
              labelText: 'Password',
              helperText: 'Password should be at least 8 Characters',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: widget.devSize.width,
            child: TextButton(
              onPressed: () {
                signUserIn();
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15),
                backgroundColor: secondaryColor,
              ),
              child: const Text(
                'SIGN IN',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: const Icon(
            Icons.warning,
            color: Colors.red,
          ),
          title: Text(
            message,
            style: GoogleFonts.lato(color: Colors.black54),
          ),
        );
      },
    );
  }

  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text(
            'Incorrect Password',
          ),
        );
      },
    );
  }
}
