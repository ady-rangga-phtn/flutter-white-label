import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_white_label/app_state/cart_state.dart';
import 'package:provider/provider.dart';
import 'package:flutter_white_label/constants/size.dart';
import 'package:flutter_white_label/constants/strings.dart';
import 'package:flutter_white_label/models/products_model.dart';
import 'package:flutter_white_label/widgets/dropdown/dropdown_widget.dart';
import 'package:flutter_white_label/widgets/text/text_link_widget.dart';
import 'package:flutter_white_label/widgets/text/text_widget.dart';

class CartProductDetailsWidget extends StatelessWidget {
  final ProductsModel data;

  const CartProductDetailsWidget({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _quantitySelected = '1';
    List<String> _quantityList = ['1', '2', '3', '12', '99', '100'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          // color: Colors.grey,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextLinkWidget(
                    text: Strings.REMOVE_ITEM,
                    color: Colors.red,
                    textAlign: TextAlign.left,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    fontSize: Size.SMALL,
                    onClick: () {
                      context.read<CartState>().remove(context, data);
                    },
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: Strings.SIZE_VARIANT,
                    textAlign: TextAlign.left,
                    fontSize: Size.SMALL,
                  ),
                  TextWidget(
                    text: Strings.SIZE_VARIANT_VALUE,
                    textAlign: TextAlign.left,
                    fontWeight: FontWeight.bold,
                    fontSize: Size.SMALL,
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: Strings.FLAVOR_VARIANT,
                    textAlign: TextAlign.left,
                    fontSize: Size.SMALL,
                  ),
                  TextWidget(
                    text: Strings.FLAVOR_VARIANT_VALUE,
                    textAlign: TextAlign.left,
                    fontWeight: FontWeight.bold,
                    fontSize: Size.SMALL,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: Strings.EDIT_ITEM,
                    color: Colors.red,
                    textAlign: TextAlign.left,
                    // padding: EdgeInsets.symmetric(horizontal: 20),
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    fontSize: Size.SMALL,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropdownWidget(
                    labelText: 'Quantity',
                    items: _quantityList,
                    onChanged: () {
                      print('onChange dropdown');
                    },
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
