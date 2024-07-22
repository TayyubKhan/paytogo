import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  static const routeName = '/error';
  const ErrorScreen({super.key, required this.error});
  final String error;
  // static Route route(String error) {
  //   return MaterialPageRoute(
  //     builder: (_) => ErrorScreen(error: error),
  //   );
  // }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(error)),
    );
  }
}
