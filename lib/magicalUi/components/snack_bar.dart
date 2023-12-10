import 'package:flutter/material.dart';

const Duration messegeDuration = const Duration(milliseconds: 4000);

message({
  required BuildContext context,
  required String text,
  required TextStyle style,
  Color? backgroundColor,
  EdgeInsetsGeometry? padding,
  SnackBarAction? action,
  bool enableCloseIcon = false,
  Color? CloseIconColor,
  Duration duration = messegeDuration,
  ShapeBorder? shape,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: style,
      ),
      duration: duration,
      shape: shape,
      backgroundColor: backgroundColor,
      padding: padding,
      showCloseIcon: enableCloseIcon,
      closeIconColor: CloseIconColor,
      action: action,
    ),
  );
}
