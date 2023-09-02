import 'dart:convert';

import 'package:coco/models/shopitem_model.dart';
import 'package:http/http.dart' as http;
class PhotoService{
  Future<List<Photos>> getAll() async{
    const url = 'https://coco-backend-cr4j.onrender.com/api/shop';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if(response.statusCode == 200){
      final json = jsonDecode(response.body) as List;
      final photos = json.map((e) {
        return Photos(id: e['id'], title: e['title'], url: e['url'], albumId: e['albumId'],available: e['available']);
      }).toList();
      return photos;
    }else{
      throw "SHits gone api fail";
    }
   }
}