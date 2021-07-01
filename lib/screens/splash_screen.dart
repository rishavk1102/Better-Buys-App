import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../server_handler.dart';
import './sellers_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showLoadingSellers = false;
  dynamic _timer;

  void getSellers() {
    ServerHandler()
        .getSellers()
        .then((value) => Navigator.of(context)
            .popAndPushNamed(SellersScreen.routeName, arguments: value))
        // ignore: avoid_print
        .catchError((e) => print(e));
  }

  @override
  void initState() {
    super.initState();

    // initializing the timer
    _timer = Timer(
        const Duration(seconds: 3),
        () => {
              showLoadingSellers = true,
              setState(() {}),
              getSellers(),
            });
  }

  @override
  void dispose() {
    // disposing the timer
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: const Color(0xffE6F3EC),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // title
            Text(
              'Better Buys',
              style: GoogleFonts.pacifico(
                color: const Color(0xff4E8489),
                fontSize: 27,
              ),
            ),

            // loading animation
            if (showLoadingSellers)
              const SizedBox(
                height: 20.0,
                width: 20.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xff4E8489)),
                  strokeWidth: 1.5,
                ),
              ),

            // loading text
            if (showLoadingSellers)
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  'Loading Sellers',
                  style: GoogleFonts.poppins(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
