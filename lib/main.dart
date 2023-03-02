import 'package:flutter/material.dart';
import 'package:fortune_room_booking_app/pages/auth/sign_in_page.dart';
import 'package:fortune_room_booking_app/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
