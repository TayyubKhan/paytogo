// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:paytogo/UI/authentication/otp_screen.dart';
import 'package:paytogo/UI/authentication/personal_details.dart';
import 'package:paytogo/UI/dashboard/homepage.dart';
import 'package:smart_auth/smart_auth.dart';

import '../UI/authentication/select_country_screen.dart';
import 'Firebase_Exception.dart';

class FirebaseAuthService {
  final smartAuth = SmartAuth();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;

  Future<void> signUpWithEmail(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw FirebaseeException('Error signing up with email: $e');
    }
  }

  Future<void> loginWithEmail(
      context, String email, String password) async {
    try {
      await _auth
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      ).then((value) async {

        DocumentSnapshot userDoc = await _fireStore
            .collection('users')
            .doc(_auth.currentUser!.uid)
            .get();
        Map<String, dynamic>? userData =
            userDoc.data() as Map<String, dynamic>?;
        if (userData != null) {
          if (!userData.containsKey('verified') ||
              userData['verified'] == false) {
            Navigator.pushNamed(context, OTPScreen.routeName,
                arguments: ScreenArguments(email));
          } else if (!userData.containsKey('country') ||
              userData['country'] == null) {
            Navigator.pushNamed(context, SelectCountryScreen.routeName);
          } else if (!userData.containsKey('FirstName') ||
              userData['FirstName'] == null ||
              !userData.containsKey('LastName') ||
              userData['LastName'] == null) {
            Navigator.pushNamed(context, PersonalDetails.routeName);
            return;
          } else {
            Navigator.pushNamed(context, HomeScreen.routeName);
          }
        }
      });
    } catch (e) {
      throw FirebaseeException('Error logging in with email: $e');
    }
  }

  Future<void> checkSignIn(BuildContext context) async {
    DocumentSnapshot userDoc =
        await _fireStore.collection('users').doc(_auth.currentUser!.uid).get();
    Map<String, dynamic>? userData = userDoc.data() as Map<String, dynamic>?;
    if (userData != null) {
      if (!userData.containsKey('verified') || userData['verified'] == false) {
        Navigator.pushNamed(context, OTPScreen.routeName,
            arguments: ScreenArguments(userData['email']));
      } else if (!userData.containsKey('country') ||
          userData['country'] == null) {
        Navigator.pushNamed(context, SelectCountryScreen.routeName);
      } else if (!userData.containsKey('FirstName') ||
          userData['FirstName'] == null ||
          !userData.containsKey('LastName') ||
          userData['LastName'] == null) {
        Navigator.pushNamed(context, PersonalDetails.routeName);
        return;
      } else {
        Navigator.pushNamed(context, HomeScreen.routeName);
      }
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw FirebaseeException('Error sending password reset email: $e');
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw FirebaseeException('Error signing out: $e');
    }
  }
}

class ScreenArguments {
  final String title;

  ScreenArguments(this.title);
}
