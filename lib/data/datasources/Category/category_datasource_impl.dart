import 'package:image_picker/image_picker.dart';

import '../../models/Category.dart';

abstract class CategoryDataSourceInterFace {
  Future<List<Category>> getCategoryFromApi(int Page);

  Future newCategory(String title, XFile thumbnail);

  Future deleteCategory(int category);

  Future updateCategory(String? title, id);

  Future<List> getCategories();
}
