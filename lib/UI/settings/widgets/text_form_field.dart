import 'package:flutter/material.dart';
import 'package:paytogo/Utils/widgets/text_styles.dart';

import 'buttons.dart';

class ProfileTextField extends StatelessWidget {
  const ProfileTextField({
    this.obscureText,
    this.height,
    this.prefixIcon,
    this.prefix,
    this.maxLength,
    this.keyboardType,
    this.hintText,
    this.onChanged,
    this.controller,
    this.validator,
    this.onSaved,
    super.key,
    this.padding,
    this.suffixIcon,
    this.topLeftRadius,
    this.topRightRadius,
    this.bottomRightRadius,
    this.bottomLeftRadius,
    this.onFieldSubmitted,
    this.textAlign,
    this.maxLines,
    this.fillColor,
    this.enabled,
    this.labelText,
    this.suffixOnTap,
  });
  final void Function(String? value)? onChanged;
  final void Function(String? value)? onSaved;
  final String? Function(String? value)? validator;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? prefix;
  final int? maxLength;
  final EdgeInsetsGeometry? padding;
  final bool? obscureText;
  final IconData? suffixIcon;
  final void Function()? suffixOnTap;
  final double? height;
  final double? topLeftRadius;
  final double? topRightRadius;
  final double? bottomRightRadius;
  final double? bottomLeftRadius;
  final TextAlign? textAlign;
  final int? maxLines;
  final Color? fillColor;
  final void Function(String? value)? onFieldSubmitted;
  final bool? enabled;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      obscureText: obscureText ?? false,
      maxLength: maxLength,
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      maxLines: maxLines ?? 1,
      onSaved: onSaved,
      textAlign: (textAlign != null) ? textAlign! : TextAlign.left,
      style: ThemeTextStyle.bodySmall(context,
          color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.8)),
      cursorColor: Theme.of(context).colorScheme.onPrimary,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: ThemeTextStyle.titleMedium(context, bold: true),
        enabled: enabled ?? true,
        // contentPadding: padding ?? const EdgeInsets.fromLTRB(25, 20, 25, 20),

        suffixIcon: (suffixIcon != null)
            ? SuffixButton(icon: suffixIcon!, onTap: suffixOnTap!)
            : null,
        counterText: '',
        hintText: hintText,
        prefixIcon: prefixIcon,
        prefix: prefix,
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.4),
            ),

        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outline,
            width: 1,
          ),
          // borderRadius: BorderRadius.circular(radius ?? 10),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outline,
            width: 1,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outline,
            width: 1,
          ),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outline,
            width: 1,
          ),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outline,
            width: 1,
          ),
        ),
      ),
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}

class MultiLineTextField extends StatelessWidget {
  const MultiLineTextField({
    this.obscureText,
    this.height,
    this.prefixIcon,
    this.prefix,
    this.maxLength,
    this.keyboardType,
    this.hintText,
    this.onChanged,
    this.controller,
    this.validator,
    this.onSaved,
    super.key,
    this.padding,
    this.suffixIcon,
    this.topLeftRadius,
    this.topRightRadius,
    this.bottomRightRadius,
    this.bottomLeftRadius,
    this.onFieldSubmitted,
    this.textAlign,
    this.maxLines,
    this.fillColor,
    this.enabled,
  });
  final void Function(String? value)? onChanged;
  final void Function(String? value)? onSaved;
  final String? Function(String? value)? validator;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? prefix;
  final int? maxLength;
  final EdgeInsetsGeometry? padding;
  final bool? obscureText;
  final Widget? suffixIcon;
  final double? height;
  final double? topLeftRadius;
  final double? topRightRadius;
  final double? bottomRightRadius;
  final double? bottomLeftRadius;
  final TextAlign? textAlign;
  final int? maxLines;
  final Color? fillColor;
  final void Function(String? value)? onFieldSubmitted;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      maxLength: maxLength,
      controller: controller,
      validator: validator,
      maxLines: maxLines ?? 1,
      onSaved: onSaved,
      textAlign: (textAlign != null) ? textAlign! : TextAlign.left,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
      cursorColor: Theme.of(context).colorScheme.onPrimary,
      decoration: InputDecoration(
        enabled: enabled ?? true,
        // contentPadding: padding ?? const EdgeInsets.fromLTRB(25, 20, 25, 20),
        suffixIcon: (suffixIcon == null) ? null : suffixIcon,
        counterText: '',
        hintText: hintText,
        prefixIcon: prefixIcon,
        prefix: prefix,
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.1),
            ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          // borderRadius: BorderRadius.circular(radius ?? 10),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeftRadius ?? 10),
            bottomLeft: Radius.circular(bottomLeftRadius ?? 10),
            bottomRight: Radius.circular(bottomRightRadius ?? 10),
            topRight: Radius.circular(topRightRadius ?? 10),
          ),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeftRadius ?? 10),
              bottomLeft: Radius.circular(bottomLeftRadius ?? 10),
              bottomRight: Radius.circular(bottomRightRadius ?? 10),
              topRight: Radius.circular(topRightRadius ?? 10),
            ),
            borderSide: BorderSide.none),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeftRadius ?? 10),
              bottomLeft: Radius.circular(bottomLeftRadius ?? 10),
              bottomRight: Radius.circular(bottomRightRadius ?? 10),
              topRight: Radius.circular(topRightRadius ?? 10),
            ),
            borderSide: BorderSide.none),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeftRadius ?? 10),
              bottomLeft: Radius.circular(bottomLeftRadius ?? 10),
              bottomRight: Radius.circular(bottomRightRadius ?? 10),
              topRight: Radius.circular(topRightRadius ?? 10),
            ),
            borderSide: BorderSide.none),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeftRadius ?? 10),
              bottomLeft: Radius.circular(bottomLeftRadius ?? 10),
              bottomRight: Radius.circular(bottomRightRadius ?? 10),
              topRight: Radius.circular(topRightRadius ?? 10),
            ),
            borderSide: BorderSide.none),
      ),
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
