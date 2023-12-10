import 'package:flutter/material.dart';


/// navigato to Route very easy
/// using to(context,route)
/// route class Widget Like HomeScreen()
to(BuildContext context, route){
  Navigator.push(context, MaterialPageRoute(
    builder: (context){
      return route;
    }
  ));
}


/// exit page
exit(BuildContext context){
  Navigator.pop(context);
}