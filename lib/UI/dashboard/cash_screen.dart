import 'package:flutter/material.dart';
import 'package:paytogo/UI/dashboard/widgets/cards.dart';
import 'package:paytogo/UI/dashboard/widgets/send_recieve_cash_sheets.dart';

import '../../Utils/widgets/text_styles.dart';

class CashScreen extends StatefulWidget {
  const CashScreen({super.key});

  @override
  State<CashScreen> createState() => _CashScreenState();
}

class _CashScreenState extends State<CashScreen> {
  bool showBanner = true;
  void toggleBanner() async {
    setState(() => showBanner = !showBanner);
    await Future.delayed(const Duration(seconds: 10));
    setState(() => showBanner = !showBanner);
  }

  void toggleSend() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => const SendCash(
        title: 'Send Cash',
      ),
    );
  }

  void toggleRecieve() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => const RecieveCash(
        title: 'Receive Cash',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.fromLTRB(size.width * 0.05, 40, size.width * 0.05, 0),
        child: Column(
          children: [
            Text(
              '\$624.00',
              style: ThemeTextStyle.displaySmall(context, bold: true),
            ),
            Text(
              'Cash Balance',
              style: ThemeTextStyle.bodySmall(context),
            ),
            const SizedBox(height: 25),
            if (showBanner)
              MainBanner(
                icon: Icons.currency_exchange,
                title: 'Passive payment set to bitcoin',
                description:
                    'You can switch to receiving all unrequested payment as cash at any time via setting.',
                onClose: toggleBanner,
              ),
            const SizedBox(height: 18),
            Row(
              children: [
                SquaredCard(
                  svg: 'assets/svg/receive.svg',
                  title: 'Receive',
                  onTap: toggleRecieve,
                ),
                const Spacer(),
                SquaredCard(
                  svg: 'assets/svg/send.svg',
                  title: 'Send',
                  onTap: toggleSend,
                ),
              ],
            ),
            const SizedBox(height: 18),
            const ImageBanner(
              icon: Icons.shopping_bag_outlined,
              imageWidth: 120,
              title: 'Shop with Paytogo',
              description:
                  'Lorem ipsum dolor sit amet consectetur. Arcu semper tristique ac cras faucibus.',
              image: 'assets/svg/cash_icon.svg',
            ),
          ],
        ),
      ),
    );
  }
}
