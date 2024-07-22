import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:paytogo/UI/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import '../Firebase_Services/Firebase_Auth_Services.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash';
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final auth = FirebaseAuth.instance;
  navigateToLogin() {
    if (auth.currentUser != null) {
      FirebaseAuthService().checkSignIn(context);
    } else {
      Navigator.of(context).pushNamed(OnBoarding.routeName);
    }
  }

  @override
  void initState() {
    Timer(const Duration(seconds: 3), navigateToLogin);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Center(
          child: Image.asset(
            'assets/images/Logo_b.png',
            height: size.width * 0.4,
          ),
        ),
      ),
    );
  }
}

String logo =
    'https://www.adaptivewfs.com/wp-content/uploads/2020/07/logo-placeholder-image.png';
