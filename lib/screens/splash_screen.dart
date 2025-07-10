import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trampoapp/screens/login_screen.dart';
import 'package:trampoapp/values/colors.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateAfterDelay();
  }
  void _navigateAfterDelay() {
    // Start the timer for 5 seconds
    Timer(
        const Duration(seconds: 5),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            width: double.infinity, // Full screen width
            height: double.infinity, // Full screen height
            decoration: const BoxDecoration(color: AppColors.blueThemeColor),
          ),
          Center(
            child: Image.asset(
              'assets/images/ic_applogo.png',
              width: 200, // Adjust the width as needed
              height: 200, // Adjust the height as needed)
            ),
          ),
        ],
      ),
    );
  }
}
