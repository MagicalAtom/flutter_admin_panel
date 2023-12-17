import 'package:flutter/material.dart';

Future<Object?> CustomDialog(
    {required BuildContext context,
    required Widget content,
    required Map<String, double> size}) {
  return showGeneralDialog(
      context: context,
      barrierLabel: 'MagicalUi',
      useRootNavigator: false,
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (context, animation, secondAnimation) {
        return Center(
          child: SizedBox(
            width: size['width'],
            height: size['height'],
            child: content,
          ),
        );
      });
}
