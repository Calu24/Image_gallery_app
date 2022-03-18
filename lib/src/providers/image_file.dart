import 'package:flutter/material.dart';

import 'dart:io';

class ImageFileProvider with ChangeNotifier{

  final List<File>? _image = <File>[];


  List<File>? get getImage => _image;

  set setImage(File image){
    _image?.add(image);

    notifyListeners();
  }
  
}
