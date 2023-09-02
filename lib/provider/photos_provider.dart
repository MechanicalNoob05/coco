import 'package:coco/models/shopitem_model.dart';
import 'package:coco/services/shop_service.dart';
import 'package:flutter/cupertino.dart';

class PhotoProvider extends ChangeNotifier {
  final PhotoService _service = PhotoService();
  List<ShopItems> _photo = [];
  List<ShopItems> get photos => _photo;
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
