import 'package:flutter/material.dart';
import 'package:paytogo/UI/onboarding/widgets/button.dart';
import 'package:paytogo/UI/settings/widgets/buttons.dart';
import 'package:paytogo/UI/settings/widgets/setting_tile.dart';

import '../dashboard/widgets/buttons.dart';

class BitcoinSettinsScreen extends StatefulWidget {
  static const routeName = '/bitcoin_settings';
  const BitcoinSettinsScreen({super.key});

  @override
  State<BitcoinSettinsScreen> createState() => _BitcoinSettinsScreenState();
}

class _BitcoinSettinsScreenState extends State<BitcoinSettinsScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: const Text('Bitcoin'),
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
                child: const Column(
                  children: [
                    SettingTile2(
                      leading: SquareButton(
                        child: SizedBox(
                          child: Icon(
                            Icons.currency_bitcoin_sharp,
                            size: 20,
                          ),
                        ),
                      ),
                      label: 'Transactions',
                      subtitle: 'Payments, purchases',
                      trailing: Icon(Icons.arrow_forward_ios_rounded, size: 18),
                    ),
                    LineSegment(),
                    SettingTile2(
                      leading: SquareButton(
                        child: SizedBox(
                          child: Icon(
                            Icons.call_received_rounded,
                            size: 20,
                          ),
                        ),
                      ),
                      label: 'Communications',
                      subtitle: 'Announcements, messages, alerts',
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
