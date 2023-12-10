import 'package:flutter/material.dart';

abstract class EasyRequestInterFace {
setCollection(String collection);
setData(Map<String,dynamic> data);
setQueryParams(queryParams);
Future get();
Future post();
}