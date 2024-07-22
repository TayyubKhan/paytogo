import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:paytogo/UI/authentication/services_screen.dart';
import 'package:paytogo/Utils/Utils.dart';
import 'package:paytogo/Utils/widgets//text_field.dart';
import 'package:paytogo/UI/onboarding/widgets/button.dart';
import 'package:flutter/material.dart';

import '../../Firebase_Services/Firebase_Services.dart';

class PersonalDetails extends StatelessWidget {
  static const routeName = '/details';
  PersonalDetails({super.key});
  final fireStore = FirebaseFirestore.instance.collection('users');
  final auth = FirebaseAuth.instance;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        leading: const LeadingButton(),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.fromLTRB(size.width * 0.06, 0, size.width * 0.06, 0),
          child: Column(
            children: [
              const SizedBox(height: 25),
              LoginTextField(
                controller: firstNameController,
                hintText: 'First Name',
              ),
              const SizedBox(height: 12),
              LoginTextField(
                controller: lastNameController,
                hintText: 'Last Name',
              ),
              const SizedBox(height: 12),
              LoginTextField(
                controller: dateOfBirthController,
                hintText: '00/00/00',
              ),
              const SizedBox(height: 60),
              SizedBox(
                width: size.width * 0.7,
                height: 55,
                child: Button(
                  onPressed: () async {
                    Map<String, dynamic> newUserData = {
                      'FirstName': firstNameController.text,
                      'LastName': lastNameController.text,
                      'DOB': dateOfBirthController.text
                    };
                    FireStoreService()
                        .updateUserData(newUserData)
                        .then((value) {
                      Navigator.of(context).pushNamed(ServicesScreen.routeName);
                    }).onError((error, stackTrace) {
                      showErrorSnackBar(context, error.toString());
                    });
                  },
                  text: 'Continue',
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
