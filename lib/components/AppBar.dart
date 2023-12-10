import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocogame/config/color.dart';
import 'package:pocogame/widgets/CustomText.dart';

PreferredSizeWidget appBarWidget() {
  return AppBar(
    title: CustomText(
      text: 'PocoGame DashBoard',
      color: Colors.white,
      fontSize: 20,
    ),
    centerTitle: true,

  );
}
