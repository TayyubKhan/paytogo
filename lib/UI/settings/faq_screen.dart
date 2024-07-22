import 'package:flutter/material.dart';
import 'package:paytogo/UI/dashboard/widgets/buttons.dart';
import 'package:paytogo/UI/onboarding/widgets/button.dart';
import 'package:paytogo/UI/settings/widgets/buttons.dart';
import 'package:paytogo/UI/settings/widgets/setting_tile.dart';
import 'package:paytogo/Utils/widgets/text_styles.dart';

class FAQScreen extends StatefulWidget {
  static const routeName = '/faq';
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQ'),
        leading: const LeadingButton(),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.help_outline_rounded))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(
              size.width * 0.05, size.width * 0.05, size.width * 0.05, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Text(
                      'Menu',
                      style: ThemeTextStyle.titleMedium(context, bold: true),
                    ),
                    const SizedBox(width: 5),
                    const Icon(Icons.add_rounded, size: 20)
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.2),
              Text('FAQ',
                  style: ThemeTextStyle.headlineMedium(context, bold: true)),
              SizedBox(height: size.width * 0.05),
              const LineSegment(),
              const SettingTile(
                height: 65,
                leading: SquareButton(
                  child: SizedBox(
                    child: Icon(
                      Icons.restart_alt,
                      size: 20,
                    ),
                  ),
                ),
                label: 'Getting started',
                trailing: Icon(Icons.add),
              ),
              const LineSegment(),
              const SettingTile(
                height: 65,
                leading: SquareButton(
                  child: SizedBox(
                    child: Icon(
                      Icons.person_outlined,
                      size: 20,
                    ),
                  ),
                ),
                label: 'Account settings',
                trailing: Icon(Icons.add),
              ),
              const LineSegment(),
              const SettingTile(
                height: 50,
                leading: SquareButton(
                  child: SizedBox(
                    child: Icon(
                      Icons.currency_bitcoin_sharp,
                      size: 20,
                    ),
                  ),
                ),
                label: 'Cash',
                trailing: Icon(Icons.add),
              ),
              const LineSegment(),
              const SettingTile(
                height: 65,
                leading: SquareButton(
                  child: SizedBox(
                    child: Icon(
                      Icons.currency_bitcoin_sharp,
                      size: 20,
                    ),
                  ),
                ),
                label: 'Bitcoin',
                trailing: Icon(Icons.add),
              ),
              const LineSegment(),
              const SettingTile(
                height: 65,
                leading: SquareButton(
                  child: SizedBox(
                    child: Icon(
                      Icons.card_giftcard_outlined,
                      size: 20,
                    ),
                  ),
                ),
                label: 'eGift',
                trailing: Icon(Icons.add),
              ),
              const LineSegment(),
              const SettingTile(
                height: 65,
                leading: SquareButton(
                  child: SizedBox(
                    child: Icon(
                      Icons.language_rounded,
                      size: 20,
                    ),
                  ),
                ),
                label: 'Send Glonally',
                trailing: Icon(Icons.add),
              ),
              const LineSegment(),
              const SettingTile(
                height: 65,
                leading: SquareButton(
                  child: SizedBox(
                    child: Icon(
                      Icons.auto_graph_outlined,
                      size: 20,
                    ),
                  ),
                ),
                label: 'Business & Developement',
                trailing: Icon(Icons.add),
              ),
              const LineSegment(),
              const SettingTile(
                height: 65,
                leading: SquareButton(
                  child: SizedBox(
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      size: 20,
                    ),
                  ),
                ),
                label: 'Tax Reporting',
                trailing: Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
