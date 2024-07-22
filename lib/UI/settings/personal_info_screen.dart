import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:paytogo/UI/onboarding/widgets/button.dart';
import 'package:paytogo/UI/settings/widgets/buttons.dart';
import 'package:paytogo/UI/settings/widgets/text_form_field.dart';
import 'package:paytogo/Utils/widgets/text_styles.dart';

class PersonalInfoScreen extends StatefulWidget {
  static const routeName = '/personal_info';
  const PersonalInfoScreen({Key? key}) : super(key: key);

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();

  bool isLoading = false;

  String? _name;
  String? _email;

  Future<void> fetchDataFromFirestore() async {
    setState(() => isLoading = true);
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .get();
      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>;
        setState(() {
          nameController.text = data['FirstName'] + data['LastName'] ?? '';
          emailController.text = data['email'] ?? '';
        });
      }
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }

  final _auth = FirebaseAuth.instance;
  Future<void> updateDataInFirestore() async {
    setState(() => isLoading = true);
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .update({
        'name': _name,
        'email': _email,
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Data updated successfully')));
    } catch (e) {
      print('Error updating data: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }

  void onSubmit() async {
    final navigator = Navigator.of(context);
    final bool isValid = formKey.currentState!.validate();
    if (!isValid) return;
    formKey.currentState!.save();
    await updateDataInFirestore();
    navigator.pop();
  }

  @override
  void initState() {
    fetchDataFromFirestore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const LeadingButton(),
        title: const Text('Personal Information'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(
              size.width * 0.05, size.width * 0.05, size.width * 0.05, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(18, size.width * 0.05, 18, 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:
                      Theme.of(context).colorScheme.onPrimary.withOpacity(0.1),
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfileTextField(
                        labelText: 'Name',
                        hintText: 'Your name',
                        controller: nameController,
                        validator: (value) {
                          if (value != null && value.isNotEmpty) {
                            return null;
                          }
                          return 'Enter your name';
                        },
                        onSaved: (name) {
                          if (name != null) {
                            _name = name;
                          }
                        },
                      ),
                      const SizedBox(height: 15),
                      ProfileTextField(
                        labelText: 'Email',
                        hintText: 'Your email address',
                        controller: emailController,
                        validator: (value) {
                          if (value != null && value.isNotEmpty) {
                            return null;
                          }
                          return 'Enter your email address';
                        },
                        onSaved: (email) {
                          if (email != null) {
                            _email = email;
                          }
                        },
                      ),
                      const SizedBox(height: 15),
                      EditButton(
                        text: 'Edit Profile',
                        onTap: onSubmit,
                        loading: isLoading,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.width * 0.05),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
