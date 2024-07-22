import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon({super.key, required this.path, this.color, this.size});
  final String path;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      height: size ?? 21,
      width: size ?? 21,
      colorFilter: ColorFilter.mode(
        color ?? Theme.of(context).colorScheme.onPrimary,
        BlendMode.srcIn,
      ),
    );
  }
}

class SquaredButton extends StatelessWidget {
  const SquaredButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  final Widget icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      style: IconButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}

class SquareButton extends StatelessWidget {
  const SquareButton({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 37,
      width: 37,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color:
            Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.7),
      ),
      child: child,
    );
  }
}

class BuySellButton extends StatelessWidget {
  const BuySellButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width,
    this.bgColor,
    this.fgColor,
  });
  final void Function() onPressed;
  final String text;
  final String? width;
  final Color? bgColor;
  final Color? fgColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            bgColor ?? Theme.of(context).colorScheme.onPrimaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w600,
              color: fgColor ?? Theme.of(context).colorScheme.onPrimary,
            ),
      ),
    );
  }
}

class DurationButton extends StatelessWidget {
  const DurationButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width,
    this.bgColor,
    this.fgColor,
  });
  final void Function() onPressed;
  final String text;
  final String? width;
  final Color? bgColor;
  final Color? fgColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColor ??
              Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.4),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: fgColor ?? Theme.of(context).colorScheme.onPrimary,
              ),
        ),
      ),
    );
  }
}
