import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/image_file.dart';


// ignore: use_key_in_widget_constructors
class FavPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final imageProvider = Provider.of<ImageFileProvider>(context);

    final image = imageProvider.getImage;

    return image!.isNotEmpty ?
    ListView.builder(
      itemCount: image.length,
      itemBuilder: (_, i){
        return 
        Image.file(
          image[i],
          width: 300,
          height: 300,
          fit: BoxFit.cover,
    );

    }) : const Center(child: Text('No fav images'));
  }
}