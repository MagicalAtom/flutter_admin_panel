import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pocogame/data/datasources/Category/category_datasource_impl.dart';
import '../../../magicalUi/config/api.dart';
import '../../../magicalUi/magic.dart';
import '../../models/Category.dart';

class CategoruDataSource implements CategoryDataSourceInterFace {
  @override
  Future deleteCategory(int category) async {
    Response response = await SwiftRequest().delete(path: ApiConfig.getAllCategories.path, id: category);
    httpResponseStatus(
        statusCode: response.statusCode as int,
        onSuccess: () {
          return 'ok';
        });
  }

  @override
  Future newCategory(String title, XFile thumbnail) async {
    String filename = thumbnail.path.split('\\').last;
    final imagePath = File(thumbnail.path);
    FormData formData = FormData.fromMap({
      "data": jsonEncode({
        "title": title,
      }),
      "files.thumbnail": await MultipartFile.fromFile(imagePath.path,
          filename: Random().nextInt(200).toString() + filename)
    });

    Response response = await SwiftRequest()
        .post(path: ApiConfig.getAllCategories.path, data: formData);

    httpResponseStatus(
        statusCode: response.statusCode as int,
        onSuccess: () {
          return 'ok';
        });
  }


  @override
  Future updateCategory(String? title, id) async {
    FormData formData = FormData.fromMap({
      "data": jsonEncode({ // تمامی موارد قبل از  ارسال به سمت سرور باید جیسان انکود بشوند
        "title": title,
      }),
    });
    Response response = await SwiftRequest()
        .put(path: ApiConfig.getAllCategories.path, id: id, data: formData);
    httpResponseStatus(
        statusCode: response.statusCode!,
        onSuccess: () {
          return 'ok';
        });
  }


  @override
  Future<List<Category>> getCategoryFromApi(int Page) async {
    final easy = EasyRequest(ApiConfig.apiRoot);
    easy.setCollection(ApiConfig.getAllCategories.path);
    easy.setQueryParams({
      "pagination": {"page": Page, "pageSize": 25},
    });
    Response finalCategoryData = await easy.get();
    List<Category> Categories = [];
    httpResponseStatus(
        statusCode: finalCategoryData.statusCode as int,
        onSuccess: () {
          for (int i = 0; i < finalCategoryData.data['data'].length; i++) {
            Categories.add(Category.fromMap(
              finalCategoryData.data['data'][i]['attributes'],
              finalCategoryData.data['data'][i]['id'].toString(),
              finalCategoryData.data['meta']["pagination"]["pageCount"],
              /*
              اینجا دونه دونه کل ریسپانس برگشتی از سمت api رو باز میکنه و موارد رو میریزه داخل
              متغیر و برمیگردونه
              یک متغیر حاوی آبجکت هایی از کلاس Category
              حالا تو ui و بعد از فولد کردن روی استیت که حاوی این
              متغیر هست و از repository گرفته میاد دونه دونه با ListView باز میکنه
              و به پراپرتی هاش دسترسی میگیره .
               */
            ));
          }
        });
    return Categories;
  }

  @override
  Future<List> getCategories() async {
    final easy = EasyRequest(ApiConfig.apiRoot);
    easy.setCollection(ApiConfig.getAllCategories.path);
    easy.setQueryParams({
      "pagination": {"page": 1, "pageSize": 2500},
    });
    Response finalCategoryData = await easy.get();
    List list = [];
    httpResponseStatus(
        statusCode: finalCategoryData.statusCode as int,
        onSuccess: () {
          for (int i = 0; i < finalCategoryData.data['data'].length; i++) {
           list.add({
             "name":finalCategoryData.data['data'][i]['attributes']['title'],
             "id":finalCategoryData.data['data'][i]['id']
           });
          }
        });
    return list;
  }
}
