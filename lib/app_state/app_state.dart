import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_white_label/models/products_model.dart';
import 'package:flutter_white_label/view_models/products_view_model.dart';

class AppState with ChangeNotifier, DiagnosticableTreeMixin {
  /// define state
  List<ProductsModel> productList = [];
  bool isLoggedIn = false;

  /// get state / selectors
  List<ProductsModel> get selectProductList => productList;
  bool get selectIsLoggedIn => isLoggedIn;

  /// set state / action-reducer
  void fetchProductList() async {
    var result = await ProductsViewModel().getProducts().then((value) => value);
    productList = result;
    notifyListeners();
  }

  void dispatchIsLoggedIn(bool status) {
    isLoggedIn = status;
    notifyListeners();
  }

  /// Makes this class readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty('productList', productList));
  }
}