import 'package:flutter/material.dart';
import 'package:pocogame/widgets/CustomText.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key, required this.onTap, required this.icon, required this.text});

  VoidCallback onTap;
  IconData? icon;
  String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      label: CustomText(text: text),
      icon:  Icon(icon, color: Colors.black, size: 26,),
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: const StadiumBorder(),
          minimumSize: const Size(120, 50)
      ),
    );
  }
}
