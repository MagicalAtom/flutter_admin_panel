import 'package:pocogame/magicalUi/SwiftRequest/ApiPath.dart';
class ApiConfig {
  static const apiRoot = 'http://localhost:1337/';

  /*
  put api path this file and class like :

  example :

 static final getProductPath =  ApiPath(name:'getProduct',path:'/getAllProduct');

 در آخر داریم
 apiRoot/getProductPath
   */




  static final getAllProducts = ApiPath(name: 'getAllProduct', path: '/api/products');
  static final getAllPosts = ApiPath(name: 'getAllPost', path: '/api/posts');




}