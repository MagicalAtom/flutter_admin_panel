import 'dart:io';

import 'package:flutter/material.dart';

class CustomFileImage extends FileImage {
  CustomFileImage(File file) : super(file);

  @override
  ImageProvider<Object> get imageProvider => this;
}