import 'package:flutter/material.dart';

class ThemeTextStyle {
  static TextStyle bodySmall(
    BuildContext context, {
    bool bold = false,
    Color? color,
    TextOverflow? overFlow,
    double? height,
  }) {
    return Theme.of(context).textTheme.bodySmall!.copyWith(
        color: color ?? Theme.of(context).colorScheme.onPrimary,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        overflow: overFlow ?? TextOverflow.ellipsis,
        height: height);
  }

  static TextStyle bodyMedium(
    BuildContext context, {
    bool bold = false,
    Color? color,
    TextOverflow? overFlow,
    double? height,
  }) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: color ?? Theme.of(context).colorScheme.onPrimary,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        overflow: overFlow ?? TextOverflow.ellipsis,
        height: height);
  }

  static TextStyle bodyLarge(
    BuildContext context, {
    bool bold = false,
    Color? color,
    TextOverflow? overFlow,
    double? height,
  }) {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        color: color ?? Theme.of(context).colorScheme.onPrimary,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        overflow: overFlow ?? TextOverflow.ellipsis,
        height: height);
  }

  static TextStyle titleSmall(
    BuildContext context, {
    bool bold = false,
    Color? color,
    TextOverflow? overFlow,
    double? height,
  }) {
    return Theme.of(context).textTheme.titleSmall!.copyWith(
        color: color ?? Theme.of(context).colorScheme.onPrimary,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        overflow: overFlow ?? TextOverflow.ellipsis,
        height: height);
  }

  static TextStyle titleMedium(
    BuildContext context, {
    bool bold = false,
    Color? color,
    TextOverflow? overFlow,
    double? height,
  }) {
    return Theme.of(context).textTheme.titleMedium!.copyWith(
        color: color ?? Theme.of(context).colorScheme.onPrimary,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        overflow: overFlow ?? TextOverflow.ellipsis,
        height: height);
  }

  static TextStyle titleLarge(
    BuildContext context, {
    bool bold = false,
    Color? color,
    TextOverflow? overFlow,
    double? height,
  }) {
    return Theme.of(context).textTheme.titleLarge!.copyWith(
        color: color ?? Theme.of(context).colorScheme.onPrimary,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        overflow: overFlow ?? TextOverflow.ellipsis,
        height: height);
  }

  static TextStyle headlineSmall(
    BuildContext context, {
    bool bold = false,
    Color? color,
    TextOverflow? overFlow,
    double? height,
  }) {
    return Theme.of(context).textTheme.headlineSmall!.copyWith(
        color: color ?? Theme.of(context).colorScheme.onPrimary,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        overflow: overFlow ?? TextOverflow.ellipsis,
        height: height);
  }

  static TextStyle headlineMedium(
    BuildContext context, {
    bool bold = false,
    Color? color,
    TextOverflow? overFlow,
    double? height,
  }) {
    return Theme.of(context).textTheme.headlineMedium!.copyWith(
        color: color ?? Theme.of(context).colorScheme.onPrimary,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        overflow: overFlow ?? TextOverflow.ellipsis,
        height: height);
  }

  static TextStyle headlineLarge(
    BuildContext context, {
    bool bold = false,
    Color? color,
    TextOverflow? overFlow,
    double? height,
  }) {
    return Theme.of(context).textTheme.headlineLarge!.copyWith(
        color: color ?? Theme.of(context).colorScheme.onPrimary,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        overflow: overFlow ?? TextOverflow.ellipsis,
        height: height);
  }

  static TextStyle displaySmall(
    BuildContext context, {
    bool bold = false,
    Color? color,
    TextOverflow? overFlow,
    double? height,
  }) {
    return Theme.of(context).textTheme.displaySmall!.copyWith(
        color: color ?? Theme.of(context).colorScheme.onPrimary,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        overflow: overFlow ?? TextOverflow.ellipsis,
        height: height);
  }

  static TextStyle displayMedium(
    BuildContext context, {
    bool bold = false,
    Color? color,
    TextOverflow? overFlow,
    double? height,
  }) {
    return Theme.of(context).textTheme.displayMedium!.copyWith(
        color: color ?? Theme.of(context).colorScheme.onPrimary,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        overflow: overFlow ?? TextOverflow.ellipsis,
        height: height);
  }

  static TextStyle displayLarge(
    BuildContext context, {
    bool bold = false,
    Color? color,
    TextOverflow? overFlow,
    double? height,
  }) {
    return Theme.of(context).textTheme.displayLarge!.copyWith(
        color: color ?? Theme.of(context).colorScheme.onPrimary,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        overflow: overFlow ?? TextOverflow.ellipsis,
        height: height);
  }
}
