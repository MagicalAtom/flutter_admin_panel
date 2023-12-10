import 'package:dartz/dartz.dart';

import '../../models/Posts.dart';

abstract class PostRepositoryInterFace {
  Future<Either<String,List<Post>>> getAllPostFromApi();
  Future<Either<String,String>> newPost(String title,String date,String text,thumbnail);

}