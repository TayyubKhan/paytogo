import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:paytogo/Firebase_Services/Firebase_Auth_Services.dart';
import 'package:paytogo/UI/authentication/select_country_screen.dart';
import 'package:paytogo/Utils/widgets//text_field.dart';

import '../../Firebase_Services/Firebase_Services.dart';
import '../../Utils/widgets/text_styles.dart';
import '../../verificationServices/VerificationServices.dart';
import '../onboarding/widgets/button.dart';

class OTPScreen extends StatefulWidget {
  static const String routeName = '/otp-screen';

  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  String _email = '';

  late FocusNode focusNode1;
  late FocusNode focusNode2;
  late FocusNode focusNode3;
  late FocusNode focusNode4;

  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();

  int secondsLeft = 60;
  String statusOTP = 'unknown';
  bool isLoading = false;

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    focusNode1.dispose();
    focusNode2.dispose();
    focusNode3.dispose();
    focusNode4.dispose();
    super.dispose();
  }

  @override
  void initState() {
    focusNode1 = FocusNode();
    focusNode2 = FocusNode();
    focusNode3 = FocusNode();
    focusNode4 = FocusNode();
    focusNode1.requestFocus(); // Auto-focus on the first text field
    startTimer();
    super.initState();
  }

  String generateVerificationCode() {
    Random random = Random();
    int randomNumber = random.nextInt(9000) +
        1000; // Generates a random number between 1000 and 9999
    return randomNumber.toString();
  }

  void startTimer() async {
    while (secondsLeft > 0) {
      setState(() => secondsLeft = secondsLeft - 1);
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  void navigateToNext() {
    Navigator.pushNamed(context, SelectCountryScreen.routeName);
  }

  void onSubmit() async {
    Map<String, dynamic>? data = await FireStoreService()
        .getDocument('users', auth.currentUser!.uid.toString());
    String actualOtp = data!['code'];
    setState(() => isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() => statusOTP = 'unknown');
    final otp = collectOTP();
    if (otp.length == 4) {
      if (otp == actualOtp) {
        final data = {
          'verified': true,
        };
        FireStoreService().updateDocumentField(
          'users',
          auth.currentUser!.uid.toString(),
          data,
        );
        setState(() => statusOTP = 'Success');

        navigateToNext();
      } else {
        setState(() => statusOTP = 'Wrong OTP');
      }
    } else {
      setState(() => statusOTP = 'Values Missing');
    }
    setState(() => isLoading = false);
  }

  final auth = FirebaseAuth.instance;
  Future<void> _sendOTP() async {
    final cUser = auth.currentUser;
    final code = generateVerificationCode();
    try {
      final data = {
        'code': code,
      };
      FireStoreService().updateDocumentField(
        'users',
        cUser!.uid.toString(),
        data,
      );
      VerificationServices().verificationServices(_email, code);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to send OTP: $e'),
        ),
      );
    }
  }

  String collectOTP() {
    return '${controller1.text}${controller2.text}${controller3.text}${controller4.text}';
  }

  void checkAndSubmitIfComplete() {
    final otp = collectOTP();
    if (otp.length == 4) {
      onSubmit();
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    _email = args.title;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        leading: const LeadingButton(),
        title: const Text('Enter code'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              size.width * 0.06, size.width * 0.06, size.width * 0.060, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Text('A 4-letter code has been sent to \n${args.title}',
                  textAlign: TextAlign.center,
                  style: ThemeTextStyle.bodyMedium(context)),
              const SizedBox(height: 30),
              SizedBox(
                width: 280,
                child: Row(
                  children: [
                    Expanded(
                      child: OTPTextField(
                        focusNode: focusNode1,
                        controller: controller1,
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          if (value != null) {
                            if (value.length == 1) {
                              focusNode2.requestFocus();
                            }
                            checkAndSubmitIfComplete();
                          }
                        },
                      ),
                    ),
                    SizedBox(width: size.width * 0.03),
                    Expanded(
                      child: OTPTextField(
                        focusNode: focusNode2,
                        controller: controller2,
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          if (value != null) {
                            if (value.length == 1) {
                              focusNode3.requestFocus();
                            }
                            checkAndSubmitIfComplete();
                          }
                        },
                      ),
                    ),
                    SizedBox(width: size.width * 0.03),
                    Expanded(
                      child: OTPTextField(
                        focusNode: focusNode3,
                        controller: controller3,
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          if (value != null) {
                            if (value.length == 1) {
                              focusNode4.requestFocus();
                            }
                            checkAndSubmitIfComplete();
                          }
                        },
                      ),
                    ),
                    SizedBox(width: size.width * 0.03),
                    Expanded(
                      child: OTPTextField(
                        focusNode: focusNode4,
                        controller: controller4,
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          if (value != null) {
                            if (value.isEmpty) {
                              focusNode3.requestFocus();
                            }
                            checkAndSubmitIfComplete();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              if (statusOTP != 'unknown') const SizedBox(height: 30),
              if (statusOTP != 'unknown')
                Container(
                  padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimary
                        .withOpacity(0.1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (statusOTP == 'Success')
                        const Icon(Icons.check_rounded, size: 16)
                      else
                        const Icon(Icons.close_rounded, size: 16),
                      const SizedBox(width: 10),
                      Text(
                        statusOTP,
                        style: ThemeTextStyle.bodySmall(context, bold: true),
                      ),
                    ],
                  ),
                ),
              SizedBox(height: size.height * 0.2),
              if (secondsLeft != 0)
                Text(
                  'Resend code in ${secondsLeft}s',
                  style: ThemeTextStyle.bodyMedium(context),
                )
              else
                InkWell(
                  onTap: () async {
                    _sendOTP();
                    startTimer();
                  },
                  child: Text(
                    'Resend OTP',
                    style: ThemeTextStyle.bodyMedium(context, bold: true),
                  ),
                ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: Button(
                  onPressed: onSubmit,
                  text: 'Continue',
                  loading: isLoading,
                  loadingText: 'Verifying OTP..',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
