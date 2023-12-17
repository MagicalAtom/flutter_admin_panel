import 'package:dartz/dartz.dart';
import 'package:pocogame/data/datasources/Category/category_datasource_impl.dart';
import 'package:pocogame/data/models/Category.dart';
import 'package:pocogame/data/repositories/Category/category_repository_impl.dart';
import 'package:pocogame/di/admin/di.dart';

import '../../../magicalUi/SwiftRequest/HttpExceptionHandle.dart';

class CategoryRepository implements CategoryRepositoryInterFace {
  final CategoryDataSourceInterFace categoryDataSource = ServiceLocator.get();

  @override
  Future deleteCategory({required int category}) async {
    try{
      var response = await categoryDataSource.deleteCategory(category);
      return right('deleted');
    }on HttpExceptionHandle catch(e){
      return left(e.message ?? '');
    }
  }



  @override
  Future<Either<String, String>> newCategory(String title, thumbnail) async {
    try {
      var send = await categoryDataSource.newCategory(title, thumbnail);
      return right("ok");
    } on HttpExceptionHandle catch (e) {
      return left(e.message ?? '');
    }
  }

  @override
  Future<Either<String, String>> updateCategory(String? title, id) async {
    try{
      var response = await categoryDataSource.updateCategory(title,id);
      return right('updated');
    }on HttpExceptionHandle catch(e){
      return left(e.message ?? '');
    }
  }

  @override
  Future<Either<String, List<Category>>> getAllCategoryFromApi(int Page) async {
    try {
      List<Category> category = await categoryDataSource.getCategoryFromApi(Page); // ریپازیتوری از دیتاسورس دیتا میگیره
      return right(category);
    } on HttpExceptionHandle catch (e) {
      return left(e.message ?? '');
    }
  }

  @override
  Future<Either<String, List>> getCategories() async {
    try{
      List categories = await categoryDataSource.getCategories();
      return right(categories);
    }on HttpExceptionHandle catch(e){
      return left(e.message ?? '');
    }
  }


  }





