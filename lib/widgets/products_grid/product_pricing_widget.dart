import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_white_label/models/products_model.dart';
import 'package:flutter_white_label/widgets/fake/fake_widget.dart';
import 'package:flutter_white_label/widgets/text/text_pricing_widget.dart';

class ProductPricingWidget extends StatelessWidget {
  final ProductsModel data;
  final MainAxisAlignment mainAxisAlignment;

  const ProductPricingWidget(
      {Key key, this.data, this.mainAxisAlignment = MainAxisAlignment.center})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (data == null) return FakeWidget();

    var hasDiscount =
        data.prices.discounted.toString().isNotEmpty ? true : false;

    var contents = [
      TextPricingWidget(
        isLineThrough: hasDiscount,
        text: data.prices.normal.toString(),
        padding: EdgeInsets.all(0),
      ),
    ];

    if (hasDiscount) {
      contents.add(TextPricingWidget(
        text: data.prices.discounted.toString(),
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        color: hasDiscount ? Colors.red : Colors.red,
      ));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: contents,
      ),
    );
  }
}
