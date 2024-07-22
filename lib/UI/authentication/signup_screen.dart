// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:paytogo/Firebase_Services/Firebase_Auth_Services.dart';
import 'package:paytogo/Firebase_Services/Firebase_Services.dart';
import 'package:paytogo/UI/authentication/otp_screen.dart';
import 'package:paytogo/UI/authentication/select_country_screen.dart';
import 'package:paytogo/UI/authentication/utilities/validations.dart';
import 'package:paytogo/Utils/Utils.dart';
import 'package:paytogo/Utils/widgets/buttons.dart';
import 'package:paytogo/Utils/widgets//check_boxes.dart';
import 'package:paytogo/Utils/widgets//text_field.dart';
import 'package:flutter/material.dart';
import 'package:paytogo/Utils/widgets/text_styles.dart';
import 'package:paytogo/ViewModel/loadingModel.dart';
import 'package:paytogo/verificationServices/VerificationServices.dart';
import 'package:provider/provider.dart';
import '../onboarding/widgets/button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/signup';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final fireStore = FirebaseFirestore.instance.collection('users');
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasDigit = false;
  bool hasSpecialCharacter = false;
  bool ispasswordValid = false;

  bool obscureText = true;
  // These both variables will contains the email and passwords that are validated
  String? _email;
  String? _password;

  // For showing any loading indicators
  bool rememberPassword = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    if (formKey.currentState != null) {
      formKey.currentState!.dispose();
    }
    super.dispose();
  }

  FlutterSecureStorage storage = const FlutterSecureStorage();

  void onChanged(bool? value) {
    setState(() => rememberPassword = !rememberPassword);
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  void updateStrengthTest() {
    hasLowerCase = passwordController.text.contains(RegExp(r'[a-z]'));
    hasUpperCase = passwordController.text.contains(RegExp(r'[A-Z]'));
    hasDigit = passwordController.text.contains(RegExp(r'[0-9]'));
    hasSpecialCharacter =
        passwordController.text.contains(RegExp(r'[_\-@&\$%\^!#]'));

    if (hasLowerCase && hasUpperCase && hasDigit && hasSpecialCharacter) {
      ispasswordValid = true;
    } else {
      ispasswordValid = false;
    }
    setState(() {});
  }

  Future<void> savePassword() async {
    await storage.write(
        key: emailController.text.toLowerCase(),
        value: passwordController.text);
  }

  void onSubmit(isLoading) async {
    final navigator = Navigator.of(context);
    isLoading.isLoading();
    final bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      isLoading.isLoading();
      return;
    }
    formKey.currentState!.save();
    if (rememberPassword) {
      await savePassword();
    }
    await FirebaseAuthService()
        .signUpWithEmail(
            emailController.text.toString(), passwordController.text.toString())
        .then((value) {
      _sendOTP().then((value) {
        navigator.pushNamed(OTPScreen.routeName,
            arguments: ScreenArguments(emailController.text));
      });
    }).onError((error, stackTrace) {
      showErrorSnackBar(context, error.toString());
    });
    isLoading.isLoading();
  }

  String generateVerificationCode() {
    Random random = Random();
    int randomNumber = random.nextInt(9000) +
        1000; // Generates a random number between 1000 and 9999
    return randomNumber.toString();
  }

  Future<void> _sendOTP() async {
    final cUser = auth.currentUser;
    final code = generateVerificationCode();
    try {
      final data = {
        'userId': cUser!.uid.toString(),
        'email': emailController.text.toString(),
        'code': code,
        'verified': false
      };
      FireStoreService().addDocument('users', cUser.uid.toString(), data);
      VerificationServices()
          .verificationServices(emailController.text.toString(), code);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to send OTP: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(
              size.width * 0.06, size.width * 0.06, size.width * 0.060, 0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Email',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                const SizedBox(height: 8),
                LoginTextField(
                  validator: (email) {
                    if (email == null || email.trim().isEmpty) {
                      return 'Email is required';
                    }
                    return emailValidator(email);
                  },
                  controller: emailController,
                  hintText: 'Enter email address',
                  keyboardType: TextInputType.emailAddress,
                  suffixIcon: SuffixIconButton(
                    icon: Icons.close_rounded,
                    onTap: () => setState(() => emailController.text = ''),
                  ),
                  onSaved: (email) {
                    _email = email!;
                  },
                ),
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Password',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                const SizedBox(height: 8),
                LoginTextField(
                  validator: (password) {
                    if (ispasswordValid) {
                      return null;
                    }
                    return 'Password is weak';
                  },
                  onChanged: (value) {
                    updateStrengthTest();
                  },
                  controller: passwordController,
                  hintText: 'Enter your password',
                  obscureText: obscureText,
                  suffixIcon: InkWell(
                    child: Icon(
                      obscureText
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    onTap: () => setState(() => obscureText = !obscureText),
                  ),
                  onSaved: (password) {
                    _password = password!;
                  },
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child:
                      Text('Strength: ${ispasswordValid ? 'Strong' : 'Weak'}',
                          style: ThemeTextStyle.bodySmall(
                            context,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withOpacity(0.6),
                          )),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    CheckBox(
                      value: rememberPassword,
                      onChanged: onChanged,
                    ),
                    GestureDetector(
                      onTap: () => onChanged(!rememberPassword),
                      child: Text(
                        'Remember password',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimary
                                  .withOpacity(0.8),
                            ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CheckListItem(validated: hasUpperCase),
                        const SizedBox(width: 10),
                        Text(
                          'Use uppercase',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CheckListItem(validated: hasLowerCase),
                        const SizedBox(width: 10),
                        Text(
                          'Use lowercase',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CheckListItem(validated: hasDigit),
                        const SizedBox(width: 10),
                        Text(
                          'Use number',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CheckListItem(validated: hasSpecialCharacter),
                        const SizedBox(width: 10),
                        Text(
                          'Use special character @\$%! etc',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.06),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: Consumer<LoadingViewModel>(
                      builder: (context, value, child) {
                    return Button(
                      onPressed: () {
                        onSubmit(value);
                      },
                      onLongPress: () {},
                      text: 'Continue',
                      loading: value.loading,
                      loadingText: 'Submitting..',
                    );
                  }),
                ),
                SizedBox(height: size.height * 0.06),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withOpacity(0.8),
                          ),
                    ),
                    SizedBox(width: size.width * 0.03),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Text(
                        'Login ',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimary
                                  .withOpacity(0.8),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
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
