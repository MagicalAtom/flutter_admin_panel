import 'package:flutter/material.dart';

to({required BuildContext context,required route}){
  return Navigator.push(context, MaterialPageRoute(builder: (context){
    return route;
  }));
}


back(BuildContext context){
  return Navigator.pop(context);
}

