import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:pocogame/data/models/Posts.dart';

abstract class PostDataSourceInterFace {

Future<List<Post>> getPostFromApi();
Future newPost(String title,String date,String text,XFile thumbnail);

}