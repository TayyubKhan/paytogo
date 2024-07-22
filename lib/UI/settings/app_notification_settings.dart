import 'package:flutter/material.dart';
import 'package:paytogo/UI/onboarding/widgets/button.dart';
import 'package:paytogo/UI/settings/widgets/buttons.dart';
import 'package:paytogo/UI/settings/widgets/setting_tile.dart';

class AppNotificationScreen extends StatefulWidget {
  static const routeName = '/notifications';
  const AppNotificationScreen({super.key});

  @override
  State<AppNotificationScreen> createState() => _AppNotificationScreenState();
}

class _AppNotificationScreenState extends State<AppNotificationScreen> {
  bool transactions = true;
  bool communication = false;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: const Text('App Notifications'),
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
                height: 160,
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
                          value: transactions,
                          onChanged: (value) {
                            setState(() => transactions = value);
                          },
                        ),
                      ),
                    ),
                    const LineSegment(),
                    SettingTile2(
                      label: 'Communications',
                      subtitle: 'Announcements, messages, alerts',
                      trailing: SizedBox(
                        height: 5,
                        child: SettingSwitch(
                          value: communication,
                          onChanged: (value) {
                            setState(() => communication = value);
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
