import 'package:flutter/material.dart';
import 'package:paytogo/UI/onboarding/widgets/button.dart';
import 'package:paytogo/UI/settings/widgets/buttons.dart';
import 'package:paytogo/UI/settings/widgets/setting_tile.dart';

class LegalScreen extends StatefulWidget {
  static const routeName = '/legal';
  const LegalScreen({super.key});

  @override
  State<LegalScreen> createState() => _LegalScreenState();
}

class _LegalScreenState extends State<LegalScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: const Text('Legal'),
        leading: const LeadingButton(),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(
              size.width * 0.05, size.width * 0.05, size.width * 0.05, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                height: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:
                      Theme.of(context).colorScheme.onPrimary.withOpacity(0.1),
                ),
                child: const Column(
                  children: [
                    SettingTile(
                      label: 'Terms of Service',
                      trailing: Icon(Icons.arrow_forward_ios_rounded, size: 18),
                    ),
                    LineSegment(),
                    SettingTile(
                      label: 'Privacy Notice',
                      trailing: Icon(Icons.arrow_forward_ios_rounded, size: 18),
                    ),
                    LineSegment(),
                    SettingTile(
                      label: 'Open Source Licences',
                      trailing: Icon(Icons.arrow_forward_ios_rounded, size: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.width * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
