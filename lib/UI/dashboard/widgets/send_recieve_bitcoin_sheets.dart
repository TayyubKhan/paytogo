import 'package:flutter/material.dart';
import 'package:paytogo/UI/dashboard/data/lists_data.dart';
import 'package:paytogo/UI/settings/widgets/buttons.dart';
import '../../settings/widgets/setting_tile.dart';
import 'buttons.dart';
import 'cards.dart';

class SendBitcoin extends StatelessWidget {
  const SendBitcoin({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BottomSheet(
      onClosing: () {},
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(0),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              shape: const RoundedRectangleBorder(
                side: BorderSide.none,
              ),
              leading: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.close,
                  size: 20,
                ),
              ),
              title: Text(
                title,
              ),
            ),
            SizedBox(height: size.width * 0.05),
            Container(
              alignment: Alignment.center,
              height: 240,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.1),
              ),
              child: ListView.separated(
                separatorBuilder: (context, index) => const LineSegment(),
                itemCount: sendBitcoinIcons.length,
                itemBuilder: (context, index) {
                  return SettingTile2(
                    subtitle: sendBitcoinDescriptions[index],
                    leading: SquareButton(
                      child: SizedBox(
                        child: Icon(
                          sendBitcoinIcons[index],
                          size: 20,
                        ),
                      ),
                    ),
                    label: sendBitcoinLabels[index],
                    onTap: () => Navigator.of(context).pop(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReceiveBitcoin extends StatelessWidget {
  const ReceiveBitcoin({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BottomSheet(
      onClosing: () {},
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(0),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              shape: const RoundedRectangleBorder(
                side: BorderSide.none,
              ),
              leading: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.close,
                  size: 20,
                ),
              ),
              title: Text(
                title,
              ),
            ),
            SizedBox(height: size.width * 0.05),
            const BitcoinAddress(bitcoinAddress: 'bfc324....h2312i8'),
            SizedBox(height: size.width * 0.05),
            Container(
              alignment: Alignment.center,
              height: 164,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.1),
              ),
              child: ListView.separated(
                separatorBuilder: (context, index) => const LineSegment(),
                itemCount: receiveBitcoinIcons.length,
                itemBuilder: (context, index) {
                  return SettingTile2(
                    subtitle: receiveBitcoinDescriptions[index],
                    leading: SquareButton(
                      child: SizedBox(
                        child: Icon(
                          receiveBitcoinIcons[index],
                          size: 20,
                        ),
                      ),
                    ),
                    label: receiveBitcoinLabels[index],
                    onTap: () => Navigator.of(context).pop(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
