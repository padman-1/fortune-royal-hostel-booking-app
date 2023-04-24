import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortune_room_booking_app/config/constants.dart';
import 'package:fortune_room_booking_app/pages/auth/sign_in_page.dart';
import 'package:fortune_room_booking_app/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/constants.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
    required this.devSize,
  });

  final Size devSize;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formkey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future signUp() async {
    showLoadingDialog(context);
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      await FirebaseAuth.instance.currentUser
          ?.updateDisplayName(_usernameController.text.trim());
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     content: Row(
      //   children: [
      //     const Icon(
      //       Icons.check_circle,
      //       color: Colors.green,
      //     ),
      //     Text('Account created successfully'),
      //   ],
      // )));
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMessage(e.code);
    }

    // addUserDetails(
    //   _usernameController.text.trim(),
    // );
  }

  // Future addUserDetails(String username) async {
  //   await FirebaseFirestore.instance.collection('users').add({
  //     'Username': username,
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (value == null || value.trim().length < 3) {
                return 'Please enter a valid username';
              }
            },
            controller: _usernameController,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              labelText: 'Username',
              helperText: 'Please enter a unique username',
            ),
          ),
          TextFormField(
            validator: (value) {
              final emailreg = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
              final matches = emailreg.hasMatch(value ?? '');
              if (!matches) {
                return 'Enter a valid email';
              }
            },
            controller: _emailController,
            decoration: const InputDecoration(
              icon: Icon(Icons.email),
              labelText: 'Email',
              helperText: 'Please enter a valid email',
            ),
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.trim().length < 6) {
                return 'Password should be 6 characters or more';
              }
            },
            controller: _passwordController,
            decoration: const InputDecoration(
                icon: Icon(Icons.lock),
                labelText: 'Password',
                helperText: 'Password should be at least 8 characters'),
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            width: widget.devSize.width,
            child: TextButton(
              onPressed: () {
                if (_formkey.currentState?.validate() ?? false) {
                  signUp();
                }
                // Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                ),
                backgroundColor: secondaryColor,
              ),
              child: const Text(
                'SIGN UP',
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
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Row(
      children: [
        const Icon(
          Icons.warning,
          color: Colors.red,
        ),
        Text(message),
      ],
    )));
  }
}
