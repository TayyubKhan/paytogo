import 'package:flutter/material.dart';
import 'package:paytogo/UI/dashboard/data/lists_data.dart';
import 'package:paytogo/UI/settings/widgets/buttons.dart';
import '../../settings/widgets/setting_tile.dart';
import 'buttons.dart';

class SendCash extends StatelessWidget {
  const SendCash({
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
                itemCount: sendCashIcons.length,
                itemBuilder: (context, index) {
                  return SettingTile2(
                    leading: SquareButton(
                      child: SizedBox(
                        child: Icon(
                          sendCashIcons[index],
                          size: 20,
                        ),
                      ),
                    ),
                    subtitle: sendCashDescriptions[index],
                    label: sendCashLabels[index],
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

class RecieveCash extends StatelessWidget {
  const RecieveCash({
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
              height: 164,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.1),
              ),
              child: ListView.separated(
                separatorBuilder: (context, index) => const LineSegment(),
                itemCount: receiveCashIcons.length,
                itemBuilder: (context, index) {
                  return SettingTile2(
                    leading: SquareButton(
                      child: SizedBox(
                        child: Icon(
                          receiveCashIcons[index],
                          size: 20,
                        ),
                      ),
                    ),
                    subtitle: receiveCashDescriptions[index],
                    label: receiveCashLabels[index],
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
