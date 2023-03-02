import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fortune_room_booking_app/config/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: devSize.height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/room.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.4),
              BlendMode.modulate,
            ),
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              // mainAxisSize: MainAxisSize.max,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    bottom: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 5,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                  child: Text(
                    'Sign Up',
                    style: GoogleFonts.manrope(
                      fontSize: 40,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                    ),
                    // style: TextStyle(fontSize: 40, color: Colors.grey[700]),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Form(
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
                            helperText:
                                'Password should be at least 8 characters'),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
