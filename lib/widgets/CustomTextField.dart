import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pocogame/widgets/CustomText.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.prefixIcon,
      required this.title,
      this.isBigTextField = false,
        required this.controller,
       required this.validator});

  Icon prefixIcon;
  String title;
  bool isBigTextField;
  TextEditingController controller;
  String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 5),
          child: CustomText(
            text: title,
            color: Colors.white,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          height: isBigTextField ? 160 : 70,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Center(
            /*
            @Todo add textFieldEditor
             */
            child: TextFormField(
              controller: controller,
              validator: validator,
              maxLines: isBigTextField ? 5 : 1,
              decoration: InputDecoration(
                errorBorder: InputBorder.none,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                prefixIcon: prefixIcon,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
