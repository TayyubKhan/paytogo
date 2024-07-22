import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:paytogo/Firebase_Services/Firebase_Auth_Services.dart';
import 'package:paytogo/UI/authentication/forgotPassword.dart';
import 'package:paytogo/UI/authentication/signup_screen.dart';
import 'package:paytogo/UI/authentication/utilities/validations.dart';
import 'package:paytogo/Utils/Utils.dart';
import 'package:paytogo/Utils/widgets/check_boxes.dart';
import 'package:paytogo/Utils/widgets//text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_auth/smart_auth.dart';
import '../../Utils/widgets/text_styles.dart';
import '../../ViewModel/loadingModel.dart';
import '../onboarding/widgets/button.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final auth = FirebaseAuth.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? _email;
  String? _password;
  FlutterSecureStorage storage = const FlutterSecureStorage();

  bool obscureText = true;
  final emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  // For showing any loading indicators
  bool rememberPassword = false;

  @override
  void dispose() {
    if (formKey.currentState != null) {
      formKey.currentState!.dispose();
    }
    super.dispose();
  }

  Future<void> savePassword() async {
    await storage.write(
        key: emailController.text.toLowerCase(),
        value: _passwordController.text);
  }

  Future<String?> retrievePassword() async {
    return await storage.read(key: emailController.text.toLowerCase());
  }

  Future<void> resetPassword() async {
    await auth.sendPasswordResetEmail(
      email: 'tayyub2001@gmail.com',
    );
  }

  void onChanged(bool? value) {
    setState(() => rememberPassword = !rememberPassword);
  }

  final smartAuth = SmartAuth();
  void onSubmit(dynamic value) async {
    smartAuth.getAppSignature();
    value.isLoading();
    final bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      value.isLoading();
      return;
    }
    formKey.currentState!.save();
    debugPrint(_email);
    debugPrint(_password);
    debugPrint(rememberPassword.toString());
    await FirebaseAuthService()
        .loginWithEmail(
      context,
      emailController.text,
      _passwordController.text,
    )
        .then((value) async {
      if (rememberPassword) {
        await savePassword();
      }
    }).onError((error, stackTrace) {
      showErrorSnackBar(context, error.toString());
    });
    value.isLoading();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
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
                    hintText: 'Enter email address',
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (email) {
                      _email = email!;
                    },
                    onFieldSubmitted: (v) async {
                      String? v = await retrievePassword();
                      if (v != null) {
                        showLogoutDialog((bool ok) {
                          if (ok) {
                            _passwordController.text = v.toString();
                          } else {}
                        });
                      }
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
                    controller: _passwordController,
                    validator: (password) {
                      if (password == null || password.trim().isEmpty) {
                        return 'Password can not be empty';
                      }
                      return null;
                    },
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
                    hintText: 'Enter your password',
                    obscureText: obscureText,
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
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary
                                        .withOpacity(0.8),
                                  ),
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () async {
                          Navigator.pushNamed(
                              context, ForgetPassword.routeName);
                        },
                        child: Text(
                          'Forgot password',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary
                                        .withOpacity(0.8),
                                  ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: size.height * 0.06),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: Consumer<LoadingViewModel>(
                        builder: (context, value, _) {
                      return Button(
                        onPressed: () async {
                          onSubmit(value);
                        },
                        text: 'Login',
                        loading: value.loading,
                        loadingText: 'Validating..',
                      );
                    }),
                  ),
                  SizedBox(height: size.height * 0.06),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimary
                                  .withOpacity(0.8),
                            ),
                      ),
                      SizedBox(width: size.width * 0.03),
                      GestureDetector(
                        onTap: () => Navigator.of(context)
                            .pushNamed(SignUpScreen.routeName),
                        child: Text(
                          'Sign up',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
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
      ),
    );
  }

  void showLogoutDialog(Function(bool) onConfirm) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text(
          'Password is savePasswordd for this email',
          style: ThemeTextStyle.bodyLarge(context, bold: true),
        ),
        content: Text(
          'Are you sure you want to Autofill',
          style: ThemeTextStyle.bodyMedium(context),
        ),
        actions: [
          TextButton(
            onPressed: () {
              onConfirm(true);
              Navigator.pop(context);
            },
            child: Text(
              'Yes',
              style: ThemeTextStyle.bodyMedium(context, bold: true),
            ),
          ),
          TextButton(
            onPressed: () {
              onConfirm(false);
              Navigator.pop(context);
            },
            child: Text(
              'No',
              style: ThemeTextStyle.bodyMedium(context,
                  bold: true,
                  color: Theme.of(context).colorScheme.onErrorContainer),
            ),
          ),
        ],
      ),
    );
  }
}
