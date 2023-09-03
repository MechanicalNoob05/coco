import 'package:coco/models/shopitem_model.dart';
import 'package:coco/services/shop_service.dart';
import 'package:flutter/cupertino.dart';
class LikeProvider extends ChangeNotifier{
  List<String> _words = [];
  List<String> get words => _words;

  void toggleLike(String word){
    final isExist = _words.contains(word);
    if(isExist){
      _words.remove(word);
    }else{
      _words.add(word);
    }
    notifyListeners();
  }
  bool isLiked(String word){
    final isExist = _words.contains(word);
    return isExist;
  }
  void clearLike(){
    _words = [];
    notifyListeners();
  }
}
class ShopFoodListProvider extends ChangeNotifier {
  final ShopFoodListService _service = ShopFoodListService();
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
class ShopAcessoriesListProvider extends ChangeNotifier {
  final ShopAcessoriesListService _service = ShopAcessoriesListService();
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
class ShopMedicineListProvider extends ChangeNotifier {
  final ShopMedicineListService _service = ShopMedicineListService();
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

class AllShopListProvider extends ChangeNotifier {
  final AllShopListService _service = AllShopListService();
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
