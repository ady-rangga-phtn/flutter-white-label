import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_white_label/constants/size.dart';
import 'package:flutter_white_label/models/products_model.dart';
import 'package:flutter_white_label/widgets/cart/cart_product_details_widget.dart';
import 'package:flutter_white_label/widgets/products_grid/product_pricing_widget.dart';
import 'package:flutter_white_label/widgets/text/text_widget.dart';

class CartProductWidget extends StatelessWidget {
  final ProductsModel data;

  const CartProductWidget({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: NetworkImage(data.image),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: data.name,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.bold,
                        fontSize: Size.NORMAL,
                      ),
                      TextWidget(
                        text: 'Item # 527964',
                        color: Colors.grey,
                        textAlign: TextAlign.left,
                        fontSize: Size.SMALL,
                      ),
                      ProductPricingWidget(
                        data: data,
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: Icon(Icons.favorite),
                  ),
                ),
              ],
            ),
            CartProductDetailsWidget(data: data),
          ],
        ),
      ),
    );
  }
}
