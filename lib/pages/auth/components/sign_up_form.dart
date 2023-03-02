import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortune_room_booking_app/config/constants.dart';

import '../../config/constants.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required this.devSize,
  });

  final Size devSize;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              labelText: 'Username',
              helperText: 'Please enter a unique username',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.email),
              labelText: 'Email',
              helperText: 'Please enter a valid email',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
                icon: Icon(Icons.lock),
                labelText: 'Password',
                helperText: 'Password should be at least 8 characters'),
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            width: devSize.width,
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
