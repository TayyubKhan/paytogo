import 'package:flutter/material.dart';
import '../../../Utils/widgets/text_styles.dart';

class SuffixButton extends StatelessWidget {
  const SuffixButton({super.key, required this.icon, required this.onTap});
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10),
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
        child: Icon(icon, size: 17),
      ),
    );
  }
}

class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.loading,
  });
  final String text;
  final VoidCallback onTap;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(5),
        width: 120,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color:
              Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (loading)
              SizedBox(
                width: 10,
                height: 10,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            if (loading) const SizedBox(width: 10),
            if (loading)
              Text(
                'Uploading..',
                style: ThemeTextStyle.bodySmall(context),
              ),
            if (!loading) const SizedBox(width: 10),
            if (!loading)
              Text(
                text,
                style: ThemeTextStyle.bodySmall(context),
              ),
          ],
        ),
      ),
    );
  }
}

class SettingSwitch extends StatelessWidget {
  const SettingSwitch(
      {super.key, required this.value, required this.onChanged});
  final bool value;
  final void Function(bool value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Switch(
        activeColor: Theme.of(context).colorScheme.primary,
        activeTrackColor: Theme.of(context).colorScheme.onPrimary,
        inactiveThumbColor: Theme.of(context).colorScheme.onPrimary,
        inactiveTrackColor: Theme.of(context).colorScheme.onPrimaryContainer,
        value: value,
        onChanged: onChanged);
  }
}

class LineSegment extends StatelessWidget {
  const LineSegment({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 0,
      color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.1),
      indent: 12,
      endIndent: 12,
    );
  }
}
