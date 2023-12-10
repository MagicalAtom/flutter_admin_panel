import 'package:dio/dio.dart';
class HttpExceptionHandle implements Exception {
  int? statusCode;
  String? message;
  Response<dynamic>? response;
  String? path;
  final query;
  final data;

  HttpExceptionHandle(
      {required this.statusCode,
      required this.message,
      this.response,
      this.path,
      this.query,
      this.data
      });
}
