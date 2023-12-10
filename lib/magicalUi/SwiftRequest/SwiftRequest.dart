import 'package:dio/dio.dart';
import 'package:pocogame/magicalUi/SwiftRequest/HttpExceptionHandle.dart';
import 'package:pocogame/magicalUi/SwiftRequest/SwiftRequest_impl.dart';
import 'package:pocogame/magicalUi/services/magical_ui_service_locator.dart';

class SwiftRequest implements SwiftRequestInterFace{

  // init Dio Service
  final Dio DioService = Services.get();



  @override
  Future get({required String path, queryParameters}) async {
  try{
   Response response = await DioService.get(path,queryParameters: queryParameters);
   return response;
  }on DioException catch(e){
    throw HttpExceptionHandle(
        statusCode: e.response?.statusCode,
        message: e.response?.data['message'],
        response: e.response,
        path: path,
        query: queryParameters,
    );
  }catch(ex){
    throw HttpExceptionHandle(
      statusCode: 000,
      message: 'Error 14402 , nothing Error',
    );
  }
  }

  @override
  Future post({required String path,required data}) async {
    try{
      Response response = await DioService.post(path,data: data);
      return response;
    }on DioException catch(e){
      throw HttpExceptionHandle(
        statusCode: e.response?.statusCode,
        message: e.response?.data['message'],
        response: e.response,
        path: path,
        data: data,
      );
    }catch(ex){
      throw HttpExceptionHandle(
        statusCode: 000,
        message: 'Error 14402 , nothing Error',
      );
    }
  }






}