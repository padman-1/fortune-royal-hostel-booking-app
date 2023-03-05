import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(
          left: 10,
          top: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello Padman',
              style: GoogleFonts.manrope(
                fontSize: 22,
              ),
            ),
            Text(
              'Welcome to book any room of your choice',
              style: GoogleFonts.manrope(
                  // fontSize: 22,
                  ),
            ),
          ],
        ));
  }
}
