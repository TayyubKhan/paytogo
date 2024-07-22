import 'package:flutter/material.dart';

import '../../../Utils/widgets/text_styles.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.onPressed,
    required this.loading,
    required this.text,
    this.onLongPress,
    this.withoutBackground = false,
    this.width,
    this.bgColor,
    this.fgColor,
    this.loadingText,
  });
  final void Function() onPressed;
  final void Function()? onLongPress;
  final String text;
  final String? width;
  final bool withoutBackground;
  final Color? bgColor;
  final Color? fgColor;
  final bool loading;
  final String? loadingText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: withoutBackground
            ? Colors.transparent
            : Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (loading)
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          if (loading) const SizedBox(width: 15),
          if (loading)
            Text(
              loadingText ?? 'loading..',
              style: ThemeTextStyle.bodyLarge(context),
            ),
          if (!loading)
            Text(
              text,
              style: ThemeTextStyle.bodyLarge(context),
            ),
        ],
      ),
    );
  }
}

class LeadingButton extends StatelessWidget {
  const LeadingButton({super.key, this.icon});
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.pop(context),
      icon: Icon(
        icon ?? Icons.arrow_back_ios_rounded,
        size: 20,
      ),
    );
  }
}
