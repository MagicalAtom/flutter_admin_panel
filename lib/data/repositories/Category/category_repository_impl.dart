import 'package:dartz/dartz.dart';

import '../../models/Category.dart';

abstract class CategoryRepositoryInterFace {
  Future<Either<String,List<Category>>> getAllCategoryFromApi(int Page);
  Future<Either<String,String>> newCategory(String title,thumbnail);
  Future deleteCategory({required int category});
  Future<Either<String,String>> updateCategory(String? title,id);
  Future<Either<String,List>> getCategories();
}