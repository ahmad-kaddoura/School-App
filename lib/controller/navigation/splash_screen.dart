import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// bool isDesktop;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Navigator()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 254, 253, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.jpg",
              height: 50.h,
              width: 50.w,
            ),
            SizedBox(
              height: 10.h,
            ),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
