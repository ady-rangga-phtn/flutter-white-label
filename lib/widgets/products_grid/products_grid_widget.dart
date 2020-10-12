import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_white_label/app_state/cart_state.dart';
import 'package:flutter_white_label/constants/size.dart';
import 'package:flutter_white_label/models/products_model.dart';
import 'package:flutter_white_label/widgets/fake/fake_widget.dart';
import 'package:flutter_white_label/widgets/spinner/spinner_overlay.dart';
import 'package:flutter_white_label/widgets/text/text_widget.dart';
import 'package:flutter_white_label/widgets/text/text_pricing_widget.dart';
import 'package:provider/provider.dart';

class ProductsGridWidget extends StatelessWidget {
  final List data;

  const ProductsGridWidget({Key key, this.data}) : super(key: key);

  Widget _productPromotion(BuildContext context) {
    return TextWidget(text: 'Free Shipping \$49+', color: Colors.red,);
  }

  Widget _productReview(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.star, size: 20),
        Icon(Icons.star, size: 20),
        Icon(Icons.star, size: 20),
        Icon(Icons.star, size: 20),
        Icon(Icons.star_half, size: 20),
        TextWidget(
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          text: '(123)',
        ),
      ],
    );
  }

  Widget _productPricing(BuildContext context, ProductsModel data) {
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: contents,
      ),
    );
  }

  List<Widget> _productsList(BuildContext context) {
    var contents = data.map<Widget>((item) {
      return GestureDetector(
        onTap: () {
          context.read<CartState>().add(item, context);
          // showDialog(
          //   context: context,
          //   builder: (BuildContext context) => SpinnerOverlay(),
          // );
          // Timer timer = new Timer(new Duration(seconds: 1), () {
          //   Navigator.of(context).pop();
          // });
        },
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image(image: NetworkImage(item.image), width: 170),
              Expanded(
                child: TextWidget(
                  text: item.name,
                  fontSize: Size.NORMAL,
                  textAlign: TextAlign.center,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                ),
              ),
              _productReview(context),
              _productPricing(context, item),
              _productPromotion(context)
            ],
          ),
        ),
      );
    }).toList();

    /// return the ui contents
    return contents;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var platform = Theme.of(context).platform;
    double statusBarHeight = platform == TargetPlatform.iOS ? 0 : 24;
    final double itemHeight =
        (size.height - kToolbarHeight - statusBarHeight) / 2;
    final double itemWidth = size.width / 2;
    if (data.length == 0) return FakeWidget();
    return Container(
      margin: EdgeInsets.all(0.0),
      padding: EdgeInsets.all(0.0),
      child: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            // childAspectRatio: 0.5,
            // childAspectRatio: 0.5869565217391305,
            childAspectRatio: orientation == Orientation.portrait
                ? (itemWidth / itemHeight)
                : (itemHeight / itemWidth),
            children: _productsList(context),
          );
        },
      ),
    );
  }
}
