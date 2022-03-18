import 'package:flutter/material.dart';

import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:open_file/open_file.dart';

import 'package:image_gallery_app/src/providers/image_file.dart';

class Item extends StatelessWidget {
  final String urlImage;
  const Item({
    Key? key,
    required this.urlImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<ImageFileProvider>(context);

    final card = Column(
      children: <Widget>[
        FadeInImage(
          image: NetworkImage(urlImage),
          placeholder: const AssetImage('assets/loading.gif'),
          fadeInDuration: const Duration(milliseconds: 200),
          height: 300.0,
          width: 300.0,
          fit: BoxFit.cover,
        ),
      ],
    );

    final container = Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Color.fromARGB(111, 244, 67, 54),
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(2.0, 10.0))
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );

    return GestureDetector(
      child: container,
      onTap: () async {

        _savingSnackBar(context, 'Save in process');
        
        final file = await _downloadPhoto(urlImage);

        imageProvider.setImage = file;

        _savingSnackBar(context, 'Added to favorites');

        // OpenFile.open(file.path);
      },
    );
  }

  Future<File> _downloadPhoto(String url) async {
  
    Random random = Random();
    int randomNumber = random.nextInt(10000);
    final String imgName =
        'IMG$randomNumber'; //Creo un nombre único para el archivo

    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$imgName');

    final response = await Dio().get(url,
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            receiveTimeout: 0));

    final raf = file.openSync(mode: FileMode.write);
    raf.writeFromSync(response.data);
    await raf.close();

    return file;
  
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> _savingSnackBar(BuildContext context, String text) {
    return ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              duration: const Duration(seconds: 3),
              content:
                  Text(text)),
        );
  }
}
