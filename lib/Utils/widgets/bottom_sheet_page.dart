import 'package:flutter/material.dart';

class BottomSheetPage extends StatelessWidget {
  const BottomSheetPage(
      {super.key, required this.title, required this.widgets});
  final String title;
  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},

      builder: (context) => Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(0),
        ),
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
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
            ...widgets,
          ],
        ),
      ),
    );
  }
}