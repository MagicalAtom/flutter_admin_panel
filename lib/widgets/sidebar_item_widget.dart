import 'package:flutter/material.dart';
import 'package:pocogame/config/color.dart';

class SideBarItem extends StatelessWidget {
  SideBarItem({super.key, required this.title, required this.icon,required this.onTapItem});

  String title;
  Icon icon;
  VoidCallback onTapItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTapItem(),
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // @todo build CustomTextWidget after downloading font
            Text(title,style: const TextStyle(color: ColorConfig.second,fontSize: 18,fontWeight: FontWeight.w600),),
            icon
          ],
        ),
      ),
    );
  }
}
