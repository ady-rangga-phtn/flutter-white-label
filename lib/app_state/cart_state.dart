import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_white_label/constants/size.dart';
import 'package:flutter_white_label/models/products_model.dart';
import 'package:flutter_white_label/widgets/spinner/spinner_overlay.dart';
import 'package:flutter_white_label/widgets/text/text_widget.dart';

class CartState with ChangeNotifier, DiagnosticableTreeMixin {
  /// define state
  List<ProductsModel> cartItemList = [];

  /// get state / selectors
  List<ProductsModel> get selectCartItemList => cartItemList;

  /// set state / action-reducer
  void add(ProductsModel item, BuildContext context) {
    cartItemList.add(item);
    spinnerLoading(context, 'Product added to cart');
    // notifyListeners();
  }

  void remove(BuildContext context, ProductsModel item) {
    cartItemList.removeWhere((el) => el.name == item.name);
    spinnerLoading(context, 'Product has been removed');
  }

  void spinnerLoading(BuildContext context, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) => SpinnerOverlay(),
    );
    new Timer(new Duration(seconds: 1), () {
      Navigator.of(context).pop();
      final snackBar = SnackBar(
        duration: new Duration(seconds: 1),
        content: TextWidget(
          text: text,
          textAlign: TextAlign.center,
          fontSize: Size.SUB_TITLE,
          color: Colors.white,
        ),
      );
      Scaffold.of(context).showSnackBar(snackBar);
      notifyListeners();
    });
  }

  /// Makes this class readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty('cartItemList', cartItemList));
  }
}
