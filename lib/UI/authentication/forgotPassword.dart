// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:paytogo/UI/authentication/login_screen.dart';
import 'package:paytogo/UI/authentication/utilities/validations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../Utils/Utils.dart';
import '../../Utils/widgets/text_field.dart';
import '../../ViewModel/loadingModel.dart';
import '../onboarding/widgets/button.dart';

class ForgetPassword extends StatefulWidget {
  static const routeName = '/forget';
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final auth = FirebaseAuth.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // These both variables will contain the email and passwords that are validated
  String? _email;
  bool obscureText = true;
  final emailController = TextEditingController();
  bool rememberPassword = false;
  bool emailAvailable = true; // Track email availability

  @override
  void dispose() {
    if (formKey.currentState != null) {
      formKey.currentState!.dispose();
    }
    super.dispose();
  }
  FlutterSecureStorage storage = const FlutterSecureStorage();
  Future<void> deletePassword() async {
    await storage.delete(key: emailController.text.toLowerCase());
  }

  Future<void> resetPassword() async {
    await auth.sendPasswordResetEmail(
      email: emailController.text.toString(),
    );
  }

  void onSubmit(dynamic value) async {
    value.isLoading();
    final bool isValid = formKey.currentState!.validate();
    if (!isValid || !emailAvailable) {
      value.isLoading();
      return;
    }

    formKey.currentState!.save();
    debugPrint(_email);
    debugPrint(rememberPassword.toString());
    await checkEmailAvailability(emailController.text);
    if (_result == 'Email is available') {
      await resetPassword().then((value)async {
        showErrorSnackBar(context, 'Email is sent to your Address');
        await deletePassword();
        Navigator.pushNamed(context, LoginScreen.routeName);
      }).onError((error, stackTrace) {
        debugPrint(error.toString());
      });
    } else {
      print('Not Sent');
    }
    value.isLoading();
  }

  String _result = '';
  Future<void> checkEmailAvailability(String email) async {
    try {
      _result = '';
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users') // replace 'users' with your collection name
          .where('email',
              isEqualTo:
                  email) // replace 'email' with the field name where the email is stored
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        setState(() {
          _result = 'Email is available';
        });
      } else {
        setState(() {
          _result = 'Email is not available.';
        });
      }
    } catch (e) {
      setState(() {
        _result = 'Error occurred while checking email.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Recover Password'),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(
                size.width * 0.06, size.width * 0.06, size.width * 0.06, 0),
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
                    controller: emailController,
                    validator: (email) {
                      if (email == null || email.trim().isEmpty) {
                        return 'Email is required';
                      }
                      return emailValidator(email);
                    },
                    onChanged: (email) {
                      emailAvailable = true;
                    },
                    onFieldSubmitted: (email) {
                      emailAvailable = true;
                      checkEmailAvailability(email!);
                    },
                    hintText: 'Enter email address',
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (email) {
                      _email = email!;
                    },
                  ),
                  if (_result != 'Email is available' &&
                      emailController.text.isNotEmpty)
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Email is not Available',
                        style: TextStyle(color: Colors.red),
                      ),
                    )
                  else
                    const SizedBox(),
                  SizedBox(height: size.height * 0.4),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: Consumer<LoadingViewModel>(
                        builder: (context, value, _) {
                      return Button(
                        onPressed: () async {
                          onSubmit(value);
                        },
                        text: 'Reset',
                        loading: value.loading,
                        loadingText: 'Validating..',
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
