import 'package:flutter/material.dart';

class SuffixIconButton extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData icon;
  final Color? iconColor;
  final Color? containerColor;
  final EdgeInsetsGeometry? margin;

  const SuffixIconButton({
    Key? key,
    required this.icon,
    this.onTap,
    this.iconColor,
    this.containerColor,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: margin ?? const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: containerColor ?? Theme.of(context).colorScheme.onPrimary.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 16,
          color: iconColor ?? Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}
