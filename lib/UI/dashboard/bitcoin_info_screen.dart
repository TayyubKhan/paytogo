import 'package:flutter/material.dart';
import 'package:paytogo/UI/dashboard/widgets/buttons.dart';
import 'package:paytogo/UI/dashboard/widgets/cards.dart';
import 'package:paytogo/UI/dashboard/widgets/graph.dart';
import 'package:paytogo/UI/onboarding/widgets/button.dart';
import '../../Utils/widgets/text_styles.dart';

class BitcoinInfoScreen extends StatefulWidget {
  static const routeName = '/bitcoin-info';
  const BitcoinInfoScreen({super.key});

  @override
  State<BitcoinInfoScreen> createState() => _BitcoinInfoScreenState();
}

class _BitcoinInfoScreenState extends State<BitcoinInfoScreen> {
  int selectedIndex = 2;
  int timePeriod = 365;
  List<int> timePeriods = [365, 365, 365, 365, 365, 365, 365];
  final List<String> timePeriodSelections = [
    'Line',
    '15m',
    '1h',
    '24h',
    '1M',
    '1Y',
    'More'
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {},
          icon: const LeadingButton(icon: Icons.close),
        ),
        title: const Text('Bitcoin'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.fromLTRB(size.width * 0.05, 0, size.width * 0.05, 0),
          child: Column(
            children: [
              const SizedBox(height: 35),
              Text(
                'Price',
                style: ThemeTextStyle.bodySmall(context, bold: true),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '\$ 41,765.80',
                    style: ThemeTextStyle.headlineMedium(context, bold: true),
                  ),
                ],
              ),
              Text('+0.42%', style: ThemeTextStyle.bodySmall(context)),
              const SizedBox(height: 25),
              Stack(
                children: [
                  SizedBox(
                    height: 200,
                    child: Graph(
                      timePeriod: timePeriod.toDouble(),
                      showTouchInfo: true,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      alignment: Alignment.center,
                      height: 35,
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.006,
                        vertical: size.width * 0.006,
                      ),
                      width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimary
                            .withOpacity(0.06),
                      ),
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            SizedBox(width: size.width * 0.005),
                        scrollDirection: Axis.horizontal,
                        itemCount: timePeriods.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: size.width * 0.12,
                            height: 25,
                            child: DurationButton(
                              bgColor: selectedIndex == index
                                  ? null
                                  : Colors.transparent,
                              onPressed: () {
                                selectedIndex = index;
                                timePeriod = timePeriods[index];
                                setState(() {});
                              },
                              text: timePeriodSelections[index],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.width * 0.05),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Data',
                    style: ThemeTextStyle.bodySmall(context, bold: true),
                  ),
                  SizedBox(height: size.width * 0.04),
                  const DataCard(title: 'Market cap', data: '\$45,123,232'),
                  SizedBox(height: size.width * 0.04),
                  const DataCard(
                      title: 'Circulating supply', data: '\$151,732,092'),
                  SizedBox(height: size.width * 0.04),
                  const DataCard(title: 'Max supply', data: '\$230,000,000'),
                  SizedBox(height: size.width * 0.04),
                  const DataCard(title: 'Total supply', data: '\$152,253,091'),
                  SizedBox(height: size.width * 0.04),
                  const DataCard(title: 'Issue price', data: '\$0.1'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
