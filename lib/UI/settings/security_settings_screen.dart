import 'package:flutter/material.dart';
import 'package:paytogo/UI/onboarding/widgets/button.dart';
import 'package:paytogo/UI/settings/faq_screen.dart';
import 'package:paytogo/UI/settings/widgets/buttons.dart';
import 'package:paytogo/UI/settings/widgets/setting_tile.dart';

class SecuritySettingScreen extends StatefulWidget {
  static const routeName = '/security_settings';
  const SecuritySettingScreen({super.key});

  @override
  State<SecuritySettingScreen> createState() => _SecuritySettingScreenState();
}

class _SecuritySettingScreenState extends State<SecuritySettingScreen> {
  bool pinEnabled = false;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: const Text('Security'),
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
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:
                      Theme.of(context).colorScheme.onPrimary.withOpacity(0.1),
                ),
                child: Column(
                  children: [
                    SettingTile2(
                      label: 'Transactions',
                      subtitle: 'Payments, purchases',
                      trailing: SizedBox(
                        child: SettingSwitch(
                          value: pinEnabled,
                          onChanged: (value) {
                            setState(() => pinEnabled = value);
                          },
                        ),
                      ),
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
