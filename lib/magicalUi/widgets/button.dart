import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({
    super.key,
    required this.onPressed,
    required this.child,
    required this.color,
    required this.borderRadius,
    required this.size,
    this.boxShadow,
  });

  VoidCallback onPressed;
  Widget child;
  Color color;
  BorderRadius borderRadius;
  /// set array format [width,height]
  List<double> size;
  List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: size[1],
        width: size[0],
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius,
          boxShadow: boxShadow,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Align(
              alignment: AlignmentDirectional.center,
              child: child,
            )
          ],
        ),
      ),
    );
  }
}
