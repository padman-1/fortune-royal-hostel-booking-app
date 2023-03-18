import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortune_room_booking_app/config/constants.dart';

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

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: _usernameController,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              labelText: 'Username',
              helperText: 'Please enter a unique username',
            ),
          ),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              icon: Icon(Icons.email),
              labelText: 'Email',
              helperText: 'Please enter a valid email',
            ),
          ),
          TextFormField(
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
              onPressed: () {},
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
}
