import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:dartz/dartz_unsafe.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pocogame/data/datasources/Post/post_datasource_impl.dart';
import 'package:pocogame/data/models/Posts.dart';
import 'package:pocogame/magicalUi/config/api.dart';
import 'package:pocogame/magicalUi/magic.dart';

class PostDataSource implements PostDataSourceInterFace {
  @override
  Future<List<Post>> getPostFromApi(int Page) async {
    final easy = EasyRequest(ApiConfig.apiRoot);
    easy.setCollection(ApiConfig.getAllPosts.path);
    Response finalPostData = await easy.get();
    easy.setQueryParams({
      "pagination[page]" : "$Page",
    });
    List<Post> posts = [];
    httpResponseStatus(
        statusCode: finalPostData.statusCode as int,
        onSuccess: () {
          for (int i = 0; i < finalPostData.data['data'].length; i++) {
            posts
                .add(Post.fromMap(finalPostData.data['data'][i]['attributes']));
          }
        });
    return posts;
  }

  @override
  Future newPost(
      String title, String date, String text, XFile thumbnail) async {
    String filename = thumbnail.path.split('\\').last;
    final imagePath = File(thumbnail.path);
    FormData formData = FormData.fromMap(
      {
        "data" : jsonEncode(
          {
            "title":title,
            "date":date,
            "text":text,
          }),
        "files.thumbnail": await MultipartFile.fromFile(imagePath.path,filename: Random().nextInt(200).toString() + filename )
      }
    );

      Response response = await SwiftRequest().post(path: ApiConfig.getAllPosts.path, data: formData);

      httpResponseStatus(statusCode: response.statusCode as int, onSuccess: (){
        return 'ok';
      });



  }
}
