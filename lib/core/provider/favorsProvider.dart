import 'package:location_app/export.dart';
import 'package:flutter/foundation.dart';
class FavorsProvider extends ChangeNotifier{
  FavorsProvider(this.activeProductId);
  int activeProductId;
 /* bool _isfavorited;
  bool get isfavorited => _isfavorited;
  void set isfavorited(bool isfavorited){
    _isfavorited = isfavorited;
    notifyListeners();
  }

  List<Product> listFavors = [];
  List<int> selectedFavors = [];
  List<int> get selectCat => selectedFavors;
  //List<Category> get categories => allCategory;

  Future<void> setSelectedFavors(int idProduct) async {
    selectedFavors.add(idProduct);
    print(selectedFavors.toString());
    notifyListeners();
  }

  Future<void> removeSelectedFavors(int idProduct) async {
    selectedFavors.remove(idProduct);
    notifyListeners();
    print(selectedFavors.toString());
  }*/
}