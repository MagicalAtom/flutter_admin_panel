import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pocogame/magicalUi/SwiftRequest/SwiftRequest.dart';
import 'package:pocogame/magicalUi/SwiftRequest/SwiftRequest_impl.dart';
import 'package:pocogame/magicalUi/config/api.dart';

final Services = GetIt.instance;

void initDioService() {
  Services.registerSingleton<Dio>(Dio(BaseOptions(baseUrl: ApiConfig.apiRoot)));
}


void initSwiftRequest(){
  Services.registerSingleton<SwiftRequestInterFace>(SwiftRequest());
}




Future<void> initAllMagicUiServices() async {
  initDioService();
  initSwiftRequest();
}