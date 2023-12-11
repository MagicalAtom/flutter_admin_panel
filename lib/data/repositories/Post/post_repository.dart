import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pocogame/data/datasources/Post/post_datasource_impl.dart';
import 'package:pocogame/data/models/Posts.dart';
import 'package:pocogame/data/repositories/Post/post_repository_impl.dart';
import 'package:pocogame/di/admin/di.dart';
import 'package:pocogame/magicalUi/SwiftRequest/HttpExceptionHandle.dart';

class PostRepository implements PostRepositoryInterFace {
  final PostDataSourceInterFace postDataSource = ServiceLocator.get();

  @override
  Future<Either<String, List<Post>>> getAllPostFromApi(int Page) async {
    try {
      List<Post> posts = await postDataSource.getPostFromApi(Page);
      return right(posts);
    } on HttpExceptionHandle catch (e) {
      return left(e.message ?? '');
    }
  }

  @override
  Future<Either<String, String>> newPost(
      String title, String date, String text, thumbnail) async {
    try {
      var send = await postDataSource.newPost(title, date, text, thumbnail);
      return right("ok");
    } on HttpExceptionHandle catch (e) {
      return left(e.message ?? '');
    }
  }

  @override
  Future<Either<String,String>> deletePost({required Post post}) async {
    try{
      final response = await postDataSource.deletePost(post);
      return right('deleted');
    }on HttpExceptionHandle catch(e){
      return left(e.message ?? '');
    }

  }
}
