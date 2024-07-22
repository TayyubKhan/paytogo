import 'package:flutter/material.dart';
import '../../../Utils/widgets/text_styles.dart';

class SliverItem extends StatelessWidget {
  const SliverItem({super.key, required this.widget});
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.fromLTRB(
            size.width * 0.05, size.width * 0.05, size.width * 0.05, 0),
        child: widget,
      ),
    );
  }
}

class SettingTile extends StatelessWidget {
  const SettingTile({
    super.key,
    this.leading,
    this.trailing,
    required this.label,
    this.onTap,
    this.height,
  });
  final Widget? leading;
  final String label;
  final Widget? trailing;
  final void Function()? onTap;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: height ?? 80,
        child: Row(
          children: [
            const SizedBox(width: 15),
            if (leading != null) leading!,
            const SizedBox(width: 15),
            Text(
              label,
              style: ThemeTextStyle.bodyMedium(context),
            ),
            if (trailing != null) const Spacer(),
            if (trailing != null) trailing!,
            if (trailing != null) const SizedBox(width: 15),
          ],
        ),
      ),
    );
  }
}

class SettingTile2 extends StatelessWidget {
  const SettingTile2({
    super.key,
    this.leading,
    this.trailing,
    required this.subtitle,
    required this.label,
    this.onTap,
  });
  final Widget? leading;
  final String label;
  final Widget? trailing;
  final String subtitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (leading == null)
              const SizedBox(width: 6)
            else
              const SizedBox(width: 15),
            if (leading != null) leading!,
            const SizedBox(width: 15),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: ThemeTextStyle.bodyMedium(context, bold: true),
                ),
                Text(
                  subtitle,
                  style: ThemeTextStyle.bodySmall(context),
                ),
              ],
            ),
            if (trailing != null) const Spacer(),
            if (trailing != null) trailing!,
            if (trailing != null) const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
