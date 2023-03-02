import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:fortune_room_booking_app/config/constants.dart';
import 'package:fortune_room_booking_app/pages/auth/sign_up_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: devSize.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/room.jpg',
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.4),
              BlendMode.modulate,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 5,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: GoogleFonts.manrope(
                          fontSize: 40,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                        ),
                        // style: TextStyle(fontSize: 40, color: Colors.grey[700]),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Form(
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
                              helperText:
                                  'Password should be at least 8 Characters',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: devSize.width,
                            child: TextButton(
                              onPressed: () {},
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
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Don't have an account?  ",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign Up Here',
                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUpPage(),
                                  ),
                                );
                              },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
