import 'package:flutter/material.dart';
import 'package:paytogo/UI/onboarding/widgets/button.dart';
import 'package:paytogo/UI/settings/faq_screen.dart';
import 'package:paytogo/UI/settings/widgets/setting_tile.dart';
import 'package:paytogo/Utils/widgets/text_styles.dart';

class LimitScreen extends StatefulWidget {
  static const routeName = '/limits';
  const LimitScreen({super.key});

  @override
  State<LimitScreen> createState() => _LimitScreenState();
}

class _LimitScreenState extends State<LimitScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: const Text('Limits'),
        leading: const LeadingButton(),
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(FAQScreen.routeName),
            icon: const Icon(Icons.help_outline_rounded),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(
              size.width * 0.05, size.width * 0.05, size.width * 0.05, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(size.width * 0.05, 0, 0, 0),
                child: Text('Cash',
                    style: ThemeTextStyle.bodyLarge(context, bold: true)),
              ),
              SizedBox(height: size.width * 0.05),
              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimary
                        .withOpacity(0.1),
                  ),
                  child: const SettingTile2(
                    label: 'Send',
                    subtitle: '\$1,500 per week (cumulative)',
                  ),
                ),
              ),
              SizedBox(height: size.width * 0.05),
              Padding(
                padding: EdgeInsets.fromLTRB(size.width * 0.05, 0, 0, 0),
                child: Text('Settings',
                    style: ThemeTextStyle.bodyLarge(context, bold: true)),
              ),
              SizedBox(height: size.width * 0.05),
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
                      label: 'Buy & Sell',
                      onTap: () {},
                      subtitle: 'Unlimited',
                    ),
                    Divider(
                      height: 0,
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withOpacity(0.1),
                    ),
                    SettingTile2(
                      label: 'Send',
                      onTap: () {},
                      subtitle: '\$1,500 per week (cummulative)',
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.width * 0.05),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 130,
        height: 40,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          child: Text(
            'Increase limits',
            style: ThemeTextStyle.bodyMedium(
              context,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}
