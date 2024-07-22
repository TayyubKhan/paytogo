import 'package:flutter/material.dart';
import 'package:paytogo/UI/dashboard/widgets/graph.dart';
import '../../../Utils/widgets/text_styles.dart';
import 'buttons.dart';

class BitcoinMainCard extends StatelessWidget {
  const BitcoinMainCard({
    super.key,
    required this.icon,
    required this.todayPrice,
    this.onTap,
    required this.increasePercentage,
  });
  final IconData icon;
  final String todayPrice;
  final String increasePercentage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: onTap ?? () {},
      child: Container(
        height: 150,
        width: size.width,
        padding: const EdgeInsets.symmetric(
          horizontal: 13,
          vertical: 13,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.1),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: SquaredButton(
                        icon: Icon(icon, size: 15),
                        onPressed: () {},
                      ),
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          todayPrice,
                          style: ThemeTextStyle.bodySmall(
                            context,
                            bold: true,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                        Text(
                          increasePercentage,
                          style: ThemeTextStyle.bodySmall(
                            context,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Expanded(child: SizedBox(height: 20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: size.width * 0.35,
                      height: 40,
                      child: BuySellButton(
                        text: 'Buy',
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(width: size.width * 0.05),
                    SizedBox(
                      width: size.width * 0.35,
                      height: 40,
                      child: BuySellButton(
                        text: 'Sell',
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Center(
              child: Graph(
                timePeriod: 365.0,
                showTouchInfo: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
