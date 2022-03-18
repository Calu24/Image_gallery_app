import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/photo_model.dart';


class UnsplashService{
  
  final clientId = 'vYKuzux0_rNAeeAS1zfq4OXQOCz_WvxwDFnSOmgBJ0M';
  final photosCount = 10; //max 30
  final orientation = 'landscape';
  
  Future<List<PhotoModel>> getPhotos() async{
    
    final url  = 'https://api.unsplash.com/photos/random?client_id=$clientId&count=$photosCount&orientation=$orientation';  
    final resp = await http.get(Uri.parse(url));

    
    // final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<dynamic> decodedData = json.decode(resp.body);
    final List<PhotoModel> photos = [];
   
    for (var data in decodedData) { 

      final photoTemp = PhotoModel.fromMap(data);
      

      photos.add(photoTemp);

     }

    return photos;

  }
}