import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Color(0xffE6F3EC),
        child: Text(
          'Better Buys',
          style: GoogleFonts.pacifico(
            color: Color(0xff4E8489),
            fontSize: 27,
          ),
        ),
      ),
    );
  }
}
