import 'package:paytogo/UI/authentication/login_screen.dart';
import 'package:paytogo/UI/onboarding/template.dart';
import 'package:flutter/material.dart';

import 'data/sliding_data.dart';

class OnBoarding extends StatefulWidget {
  static const routeName = '/onBoarding';
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;
  PageController pageController = PageController(keepPage: true);
  void goToNext() {
    if (currentIndex < imagePaths.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
      );
    }
  }

  void skip() {
    Navigator.of(context).pushNamed(LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: imagePaths.length,
        onPageChanged: (index) => setState(() => currentIndex = index),
        itemBuilder: (context, index) => SlidingPages(
          index: index,
          goToNext: goToNext,
          skip: skip,
        ),
      ),
    );
  }
}
