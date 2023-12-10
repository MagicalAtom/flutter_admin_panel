import 'dart:io';
import 'package:image_picker/image_picker.dart';

Future<XFile?>  pickImageFromGallery() async {
  final ImagePicker picker = ImagePicker();
  final XFile? photo = await picker.pickImage(source: ImageSource.gallery);
  return photo;
}

