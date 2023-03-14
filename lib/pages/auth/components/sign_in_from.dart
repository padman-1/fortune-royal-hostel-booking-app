import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortune_room_booking_app/config/constants.dart';
import 'package:fortune_room_booking_app/pages/home/home_page.dart';

import '../../config/constants.dart';
import '../card_verification.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
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
              icon: Icon(Icons.email),
              labelText: 'Email',
              helperText: 'Please enter a Valid Email',
            ),
          ),
          TextFormField(
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
            width: devSize.width,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
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
}
