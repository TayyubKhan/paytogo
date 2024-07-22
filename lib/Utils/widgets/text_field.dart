import 'package:flutter/material.dart';
import 'package:paytogo/Utils/widgets/text_styles.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({
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
    this.onFieldSubmitted,
    this.textAlign,
    this.maxLines,
    this.fillColor,
    this.enabled,
    this.autofill
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
  final TextAlign? textAlign;
  final int? maxLines;
  final Color? fillColor;
  final void Function(String? value)? onFieldSubmitted;
  final bool? enabled;
  final Iterable<String>? autofill;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofillHints: autofill,
      obscureText: obscureText ?? false,
      maxLength: maxLength,
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      maxLines: maxLines ?? 1,
      onSaved: onSaved,
      obscuringCharacter: 'x',
      textAlign: (textAlign != null) ? textAlign! : TextAlign.left,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
      cursorColor: Theme.of(context).colorScheme.onPrimary,
      decoration: InputDecoration(
        isDense: true,

        enabled: enabled ?? true,
        // contentPadding: padding ?? const EdgeInsets.fromLTRB(25, 20, 25, 20),
        filled: true,
        suffixIcon: (suffixIcon == null) ? null : suffixIcon,
        counterText: '',
        fillColor: fillColor ??
            Theme.of(context).colorScheme.onPrimary.withOpacity(0.06),
        hintText: hintText,
        prefixIcon: prefixIcon,
        prefix: prefix,
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.1),
            ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outline,
            width: 1,
          ),
          // borderRadius: BorderRadius.circular(radius ?? 10),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outline,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outline,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outline,
            width: 1,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
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

class OTPTextField extends StatelessWidget {
  const OTPTextField({
    this.obscureText,
    this.maxLength,
    this.keyboardType,
    this.onChanged,
    this.controller,
    this.validator,
    this.onSaved,
    super.key,
    this.padding,
    this.focusNode,
  });
  final void Function(String? value)? onChanged;
  final void Function(String? value)? onSaved;
  final String? Function(String? value)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLength;
  final EdgeInsetsGeometry? padding;
  final bool? obscureText;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      obscureText: obscureText ?? false,
      maxLength: 1,
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      onSaved: onSaved,
      textAlign: TextAlign.center,
      style: ThemeTextStyle.titleLarge(context, height: 1.0),
      cursorColor: Theme.of(context).colorScheme.onPrimary,
      decoration: InputDecoration(
        counterText: '',
        // contentPadding: padding ?? const EdgeInsets.fromLTRB(18, 16, 18, 16),
        filled: true,
        fillColor: Theme.of(context).colorScheme.onPrimary.withOpacity(0.06),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outline,
            width: 1,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outline,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outline,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outline,
            width: 1,
          ),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
