/*
Responsive ui design base on bootstrap  breakpoints
*/

import 'package:flutter/material.dart';

enum MagicUiBreakPoints {
  /// width < 600
  sm,
  /// width < 1240
  md,
  /// width < 1440
  lg,
  /// width < infinity
  xl,
}



// detect Size and return breakpoints name
extension SizeDetector on MediaQueryData {
  MagicUiBreakPoints get magicUiBreakPoints {
    if (size.width < 600) {
      return MagicUiBreakPoints.sm;
    } else if (size.width < 1240) {
      return MagicUiBreakPoints.md;
    } else if (size.width < 1440) {
      return MagicUiBreakPoints.lg;
    } else {
      return MagicUiBreakPoints.xl;
    }
  }
}
