import 'package:paytogo/Firebase_Services/Firebase_Services.dart';
import 'package:paytogo/UI/authentication/login_screen.dart';
import 'package:paytogo/Utils/widgets//text_field.dart';
import 'package:paytogo/UI/onboarding/widgets/button.dart';
import 'package:flutter/material.dart';

import '../dashboard/homepage.dart';

class ServicesScreen extends StatelessWidget {
  static const routeName = '/services';
  ServicesScreen({super.key});

  TextEditingController txt1 = TextEditingController();
  TextEditingController txt2 = TextEditingController();
  TextEditingController txt3 = TextEditingController();
  TextEditingController txt4 = TextEditingController();
  TextEditingController txt5 = TextEditingController();
  TextEditingController txt6 = TextEditingController();
  TextEditingController txt7 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        leading: const LeadingButton(
          icon: Icons.close,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.fromLTRB(size.width * 0.06, 0, size.width * 0.06, 0),
          child: Column(
            children: [
              const SizedBox(height: 25),
              LoginTextField(
                controller: txt1,
                hintText: 'Buy bitcoin via debut card',
              ),
              const SizedBox(height: 12),
              LoginTextField(
                controller: txt2,
                hintText: 'Send cash to bank or mobile accounts',
              ),
              const SizedBox(height: 12),
              LoginTextField(
                controller: txt3,
                hintText: 'Send and receive eGift',
              ),
              const SizedBox(height: 12),
              LoginTextField(
                controller: txt4,
                hintText: 'Mobile TopUp and eSim',
              ),
              const SizedBox(height: 12),
              LoginTextField(
                controller: txt5,
                hintText: 'Calling Plans and Number',
              ),
              const SizedBox(height: 12),
              LoginTextField(
                controller: txt6,
                hintText: 'Private and Business Banking',
              ),
              const SizedBox(height: 12),
              LoginTextField(
                controller: txt7,
                hintText: 'Access higher limits',
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: size.width * 0.7,
                height: 55,
                child: Button(
                  onPressed: () async {
                    final newUserData = {
                      'buyBitcoin': txt1.text.toString(),
                      'sendCash': txt2.text,
                      'sendGift': txt3.text,
                      'topUp': txt4.text,
                      'CallingPlans': txt5.text,
                      'Banking': txt6.text,
                      'AccessLimits': txt7.text,
                    };
                    FireStoreService()
                        .updateUserData(newUserData)
                        .then((value) {
                      Navigator.of(context).pushNamed(HomeScreen.routeName);
                    });
                  },
                  text: 'Confirm',
                  loading: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
