import 'package:dartz/dartz.dart';

import '../../models/Posts.dart';

abstract class PostRepositoryInterFace {
  Future<Either<String,List<Post>>> getAllPostFromApi(int Page);
  Future<Either<String,String>> newPost(String title,String date,String text,thumbnail);
  Future deletePost({required int post});
  Future<Either<String,String>> updatePost(String? title,String? date,String? text,id);


}