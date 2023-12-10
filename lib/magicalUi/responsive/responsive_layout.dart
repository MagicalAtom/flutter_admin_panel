import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  ResponsiveLayout({
    super.key,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
  });
  Widget sm;
  Widget md;
  Widget lg;
  Widget xl;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return sm;
        } else if (constraints.maxWidth < 1240) {
          return md;
        } else if (constraints.maxWidth < 1440) {
          return lg;
        } else {
          return xl;
        }
      },
    );
  }
}
