import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pocogame/magicalUi/SwiftRequest/SwiftRequest_impl.dart';
import 'package:pocogame/magicalUi/SwiftRequest/easyRequest_impl.dart';
import 'package:pocogame/magicalUi/magic.dart';
import 'package:pocogame/magicalUi/services/magical_ui_service_locator.dart';



class EasyRequest implements EasyRequestInterFace {
  final SwiftRequestInterFace swiftRequest = Services.get();
  String base;
  String? collection;
  Map<String, dynamic>? data;
  var QueryParams;
  Response? swiftResponse;

  EasyRequest(this.base);

  @override
  setCollection(String collection) {
    this.collection = collection;
    return this;
  }

  @override
  setQueryParams(queryParam) {
    QueryParams = queryParam;
  }

  @override
  Future<dynamic> get() async {
      Response response = await swiftRequest.get(path: collection as String,queryParam: QueryParams);
      return response;
  }

  @override
  Future<dynamic> post() async {
    if (data == null) {
      throw Exception('please set data before using post method');
    } else {
      Response response =
          await swiftRequest.post(path: collection as String, data: data!);
      response = response;
      return response;

    }
  }

  @override
  setData(Map<String, dynamic> data) {
    this.data = data;
  }


}
