import 'package:flutter/material.dart';
import 'package:paytogo/UI/dashboard/widgets/bitcon_main_card.dart';
import 'package:paytogo/UI/dashboard/widgets/cards.dart';
import 'package:paytogo/UI/dashboard/widgets/send_recieve_bitcoin_sheets.dart';
import '../../Utils/widgets/text_styles.dart';
import 'bitcoin_info_screen.dart';

class BitCoinScreen extends StatefulWidget {
  const BitCoinScreen({super.key});

  @override
  State<BitCoinScreen> createState() => _BitCoinScreenState();
}

class _BitCoinScreenState extends State<BitCoinScreen> {
  void toggleSendBitcoin() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => const SendBitcoin(
        title: 'Send Bitcoin',
      ),
    );
  }

  void toggleReceiveBitcoin() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => const ReceiveBitcoin(
        title: 'Receive Bitcoin',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(size.width * 0.05, 25, size.width * 0.05, 0),
        child: Column(
          children: [
            Text(
              'BTC',
              style: ThemeTextStyle.bodySmall(context, bold: true),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.currency_bitcoin_sharp,
                  size: 40,
                ),
                Text(
                  '624.00',
                  style: ThemeTextStyle.displaySmall(context, bold: true),
                ),
              ],
            ),
            Text(
              'Bitcoin Balance',
              style: ThemeTextStyle.bodySmall(context),
            ),
            const SizedBox(height: 25),
            BitcoinMainCard(
              icon: Icons.currency_bitcoin_sharp,
              increasePercentage: '+0.23% today',
              todayPrice: '\$62,412.00',
              onTap: () =>
                  Navigator.of(context).pushNamed(BitcoinInfoScreen.routeName),
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                SquaredCard(
                  svg: 'assets/svg/receive.svg',
                  title: 'Receive',
                  onTap: toggleReceiveBitcoin,
                ),
                const Spacer(),
                SquaredCard(
                  svg: 'assets/svg/send.svg',
                  title: 'Send',
                  onTap: toggleSendBitcoin,
                ),
              ],
            ),
            const SizedBox(height: 18),
            const ImageBanner(
              icon: Icons.calendar_month_sharp,
              title: 'Unsure when to buy?',
              description:
                  'Lorem ipsum dolor sit amet consectetur. Arcu semper tristique ac cras faucibus a egestas ltrices.',
              image: 'assets/svg/coins.svg',
            ),
            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
}
