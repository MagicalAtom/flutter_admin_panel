import 'package:flutter/material.dart';
httpResponseStatus({
  required int statusCode,
  required Function onSuccess,
}) {
  switch (statusCode) {
    case 200:
      onSuccess();
      break;


  }
}
