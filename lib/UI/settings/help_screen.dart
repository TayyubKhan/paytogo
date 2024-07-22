import 'package:flutter/material.dart';
import 'package:paytogo/UI/onboarding/widgets/button.dart';
import 'package:paytogo/UI/settings/widgets/buttons.dart';
import 'package:paytogo/UI/settings/widgets/setting_tile.dart';

import '../../Utils/widgets/text_styles.dart';
import 'data/profile_lists.dart';
import 'help_template.dart';

class HelpScreen extends StatefulWidget {
  static const routeName = '/help';
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final functions = [
      () => Navigator.of(context).pushNamed(
            HelpTemplateScreen.routeName,
            arguments: {
              'title': 'Account access',
              'onConfirm': () => Navigator.of(context).pop(),
            },
          ),
      () => Navigator.of(context).pushNamed(
            HelpTemplateScreen.routeName,
            arguments: {
              'title': 'Account limits',
              'onConfirm': () => Navigator.of(context).pop(),
            },
          ),
      () => Navigator.of(context).pushNamed(
            HelpTemplateScreen.routeName,
            arguments: {
              'title': 'Account verification',
              'onConfirm': () => Navigator.of(context).pop(),
            },
          ),
      () => Navigator.of(context).pushNamed(
            HelpTemplateScreen.routeName,
            arguments: {
              'title': 'Deposits & withdrawals',
              'onConfirm': () => Navigator.of(context).pop(),
            },
          ),
      () => Navigator.of(context).pushNamed(
            HelpTemplateScreen.routeName,
            arguments: {
              'title': 'Payments',
              'onConfirm': () => Navigator.of(context).pop(),
            },
          ),
      () => Navigator.of(context).pushNamed(
            HelpTemplateScreen.routeName,
            arguments: {
              'title': 'Bitcoin & Lightning',
              'onConfirm': () => Navigator.of(context).pop(),
            },
          ),
      () => Navigator.of(context).pushNamed(
            HelpTemplateScreen.routeName,
            arguments: {
              'title': 'Referrals',
              'onConfirm': () => Navigator.of(context).pop(),
            },
          ),
      () => Navigator.of(context).pushNamed(
            HelpTemplateScreen.routeName,
            arguments: {
              'title': 'Feedback',
              'onConfirm': () => Navigator.of(context).pop(),
            },
          ),
      () => Navigator.of(context).pushNamed(
            HelpTemplateScreen.routeName,
            arguments: {
              'title': 'Other',
              'onConfirm': () => Navigator.of(context).pop(),
            },
          ),
    ];

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: const Text('Help'),
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
                child: const Column(
                  children: [
                    SettingTile(
                      label: 'Terms of Service',
                      trailing: Icon(Icons.arrow_forward_ios_rounded, size: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.width * 0.05),
              Padding(
                padding: EdgeInsets.fromLTRB(size.width * 0.05, 0, 0, 0),
                child: Text('Contact support',
                    style: ThemeTextStyle.bodyLarge(context, bold: true)),
              ),
              SizedBox(height: size.width * 0.05),
              Container(
                alignment: Alignment.center,
                height: 543,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:
                      Theme.of(context).colorScheme.onPrimary.withOpacity(0.1),
                ),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => const LineSegment(),
                  itemCount: helps.length,
                  itemBuilder: (context, index) {
                    return SettingTile(
                      label: helps[index],
                      height: 60,
                      trailing:
                          const Icon(Icons.arrow_forward_ios_rounded, size: 18),
                      onTap: functions[index],
                    );
                  },
                ),
              ),
              SizedBox(height: size.width * 0.1),
            ],
          ),
        ),
      ),
    );
  }
}
