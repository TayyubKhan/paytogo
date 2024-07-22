import 'package:flutter/material.dart';

class CheckBox extends StatelessWidget {
  const CheckBox({
    super.key,
    required this.value,
    required this.onChanged,
  });
  final bool value;
  final void Function(bool? value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      margin: const EdgeInsets.fromLTRB(0, 5, 5, 5),
      child: Checkbox(
        checkColor: Theme.of(context).colorScheme.onSecondaryContainer,
        activeColor: Theme.of(context).colorScheme.secondaryContainer,
        fillColor: MaterialStatePropertyAll(
            Theme.of(context).colorScheme.secondaryContainer),
        side: BorderSide(
          color: Theme.of(context).colorScheme.onSecondaryContainer,
          width: 2,
        ),
        value: value,
        onChanged: onChanged,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(
            color: Theme.of(context).colorScheme.onSecondaryContainer,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}

class CheckListItem extends StatelessWidget {
  const CheckListItem({
    super.key,
    required this.validated,
  });
  final bool validated;

  @override
  Widget build(BuildContext context) {
    if (validated) {
      return CircleAvatar(
        radius: 8,
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        child: Icon(
          size: 14,
          Icons.check_rounded,
          color: Theme.of(context).colorScheme.onSecondaryContainer,
        ),
      );
    } else {
      return CircleAvatar(
        radius: 8,
        backgroundColor: Theme.of(context).colorScheme.errorContainer,
        child: Icon(
          size: 14,
          Icons.close_rounded,
          color: Theme.of(context).colorScheme.onErrorContainer,
        ),
      );
    }
  }
}
