import 'package:flutter/material.dart';
import 'package:pocogame/routes/app_route.dart';

/// navigate to route name
route({required BuildContext context, required String name,bool navigate=false}) {
  var navigateTo;
  if (appRoute.isNotEmpty) {
    for (int i = 0; i < appRoute.length; i++) {
      if (appRoute[i].name == name) {
        navigateTo = appRoute[i].widget;
        break;
      }
    }
    if (navigateTo != null) {
     if(navigate){
       return Navigator.push(context, MaterialPageRoute(builder: (context) {
         return navigateTo;
       }));
     }else{
       return navigateTo;
     }
    } else {
      throw new Exception(
          'route not fount , add your route in routes/app_route.dart in project root');
    }
  } else {
    throw new Exception(
        'appRoute not found , check routes/app_route.dart in project root');
  }
}
