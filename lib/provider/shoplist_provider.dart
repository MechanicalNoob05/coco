import 'package:coco/models/shopitem_model.dart';
import 'package:coco/services/shop_service.dart';
import 'package:flutter/cupertino.dart';

class ShopListProvider extends ChangeNotifier {
  final ShopListService _service = ShopListService();
  List<ShopItems> _shoplist = [];
  List<ShopItems> get shoplist => _shoplist;
  bool gotList = false;
  bool isLoading = false;

  Future<void> getAllShopItems() async {
    isLoading = true;
    notifyListeners();
    final response = await _service.getAll();
    _shoplist = response;
    isLoading = false;
    notifyListeners();
  }
}
