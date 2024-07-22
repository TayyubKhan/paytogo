import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:paytogo/Firebase_Services/Firebase_Services.dart';
import 'package:paytogo/UI/authentication/personal_details.dart';
import 'package:paytogo/Utils/Utils.dart';
import 'package:paytogo/Utils/widgets/bottom_sheet_page.dart';
import 'package:paytogo/Utils/widgets/cards.dart';
import 'package:paytogo/UI/onboarding/widgets/button.dart';
import 'package:paytogo/Utils/widgets/text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'data/dummy_text.dart';

class SelectCountryScreen extends StatefulWidget {
  static const routeName = '/country';
  const SelectCountryScreen({super.key});

  @override
  State<SelectCountryScreen> createState() => _SelectCountryScreenState();
}

class _SelectCountryScreenState extends State<SelectCountryScreen> {
  String selectedCountry = 'Pakistan';

  // This will take the data form nested widget and put it inside selectedCountry variable
  getCountry(String country) {
    setState(() => selectedCountry = country);
  }

  showTermsOfServices(Size size) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => BottomSheetPage(
        title: 'Terms of Services',
        widgets: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              dummyText,
              style: ThemeTextStyle.bodyMedium(
                context,
                overFlow: TextOverflow.visible,
              ),
            ),
          ),
        ],
      ),
    );
  }

  showPrivacyNotice(Size size) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => BottomSheetPage(
        title: 'Privacy Notice',
        widgets: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              dummyText,
              style: ThemeTextStyle.bodyMedium(
                context,
                overFlow: TextOverflow.visible,
              ),
            ),
          ),
        ],
      ),
    );
  }

  final fireStore = FirebaseFirestore.instance.collection('users');
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const LeadingButton(),
        title: const Text('Country'),
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Image.asset('assets/images/background.png'),
          ),
          Container(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.9),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  size.width * 0.06, size.width * 0.06, size.width * 0.06, 10),
              child: Column(
                children: [
                  SelectCountryCard(
                    addSelectedCountry: getCountry,
                    country: selectedCountry,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: RichText(
                      text: TextSpan(
                        text: "By clicking \"agree\" you have agreed to ",
                        style: ThemeTextStyle.bodySmall(context),
                        children: [
                          TextSpan(
                            text: "terms of service",
                            style:
                                ThemeTextStyle.bodySmall(context, bold: true),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => showTermsOfServices(size),
                          ),
                          const TextSpan(text: " and "),
                          TextSpan(
                            text: "privacy notice",
                            style:
                                ThemeTextStyle.bodySmall(context, bold: true),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => showPrivacyNotice(size),
                          ),
                          const TextSpan(text: "."),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: size.width * 0.6),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: Button(
                      text: 'Agree',
                      onPressed: () async {
                        Map<String, dynamic> newUserData = {
                          'country': selectedCountry,
                        };
                        FireStoreService()
                            .updateUserData(newUserData)
                            .then((value) {
                          Navigator.of(context)
                              .pushNamed(PersonalDetails.routeName);
                        }).onError((error, stackTrace) {
                          showErrorSnackBar(context, error.toString());
                        });
                      },
                      loading: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
