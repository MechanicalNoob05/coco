import 'package:coco/models/photos_model.dart';
import 'package:coco/services/photo_service.dart';
import 'package:flutter/cupertino.dart';

class PhotoProvider extends ChangeNotifier {
  final PhotoService _service = PhotoService();
  List<Photos> _photo = [];
  List<Photos> get photos => _photo;
  bool gotList = false;
  bool isLoading = false;

  Future<void> getAllPhotos() async {
    isLoading = true;
    notifyListeners();
    final response = await _service.getAll();
    _photo = response;
    isLoading = false;
    notifyListeners();
  }
}
