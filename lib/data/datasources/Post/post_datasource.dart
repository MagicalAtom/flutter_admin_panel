import 'dart:convert';
import 'dart:io';
import 'dart:math';
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
    easy.setQueryParams({
      "pagination": {"page": Page, "pageSize": 25},
    });
    Response finalPostData = await easy.get();
    List<Post> posts = [];
    httpResponseStatus(
        statusCode: finalPostData.statusCode as int,
        onSuccess: () {
          for (int i = 0; i < finalPostData.data['data'].length; i++) {
            posts.add(Post.fromMap(finalPostData.data['data'][i]['attributes'],
                finalPostData.data['data'][i]['id'].toString(),
                finalPostData.data['meta']["pagination"]["pageCount"],
            ));
          }
        });
    return posts;
  }

  @override
  Future newPost(
      String title, String date, String text, XFile thumbnail) async {
    String filename = thumbnail.path.split('\\').last;
    final imagePath = File(thumbnail.path);
    FormData formData = FormData.fromMap({
      "data": jsonEncode({
        "title": title,
        "date": date,
        "text": text,
      }),
      "files.thumbnail": await MultipartFile.fromFile(imagePath.path,
          filename: Random().nextInt(200).toString() + filename)
    });

    Response response = await SwiftRequest()
        .post(path: ApiConfig.getAllPosts.path, data: formData);

    httpResponseStatus(
        statusCode: response.statusCode as int,
        onSuccess: () {
          return 'ok';
        });
  }

  @override
  Future deletePost(int post) async {
    Response response = await SwiftRequest().delete(path: ApiConfig.getAllPosts.path, id: post);
      httpResponseStatus(
          statusCode: response.statusCode as int,
          onSuccess: () {
            return 'ok';
          });
  }

  @override
  Future updatePost(String? title, String? date, String? text,id) async {
    FormData formData = FormData.fromMap({
      "data": jsonEncode({
        "title": title,
        "date": date,
        "text": text,
      }),
    });
    Response response = await SwiftRequest().put(path: ApiConfig.getAllPosts.path, id: id, data: formData);
    httpResponseStatus(
        statusCode: response.statusCode!,
        onSuccess: () {
          return 'ok';
        });
  }
}
