import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_white_label/navigations/Navigation.dart';
import 'package:provider/provider.dart';
import 'package:flutter_white_label/app_state/cart_state.dart';
import 'package:flutter_white_label/constants/size.dart';
import 'package:flutter_white_label/constants/strings.dart';
import 'package:flutter_white_label/routes.dart';
import 'package:flutter_white_label/view_models/products_view_model.dart';
import 'package:flutter_white_label/widgets/app_bar/app_bar_widget.dart';
import 'package:flutter_white_label/widgets/cart/cart_product_widget.dart';
import 'package:flutter_white_label/widgets/fake/fake_widget.dart';
import 'package:flutter_white_label/widgets/safe_area/save_area_widget.dart';
import 'package:flutter_white_label/widgets/search_bar/search_bar_widget.dart';
import 'package:flutter_white_label/widgets/text/text_clickable_widget.dart';
import 'package:flutter_white_label/widgets/text/text_widget.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var cartItems = 10;
  var radioChecked = 1;

  void _handleChangeRadio(int value) {
    setState(() {
      radioChecked = value;
    });
  }

  Widget _approachPromo(BuildContext context, CartState cartState) {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.circular(5),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey,
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                value: 0.8,
                minHeight: 10,
              ),
            ),
          ),
          TextWidget(
            textAlign: TextAlign.center,
            text: Strings.APPROACH_PROMO_MESSAGE,
            fontSize: Size.SMALL,
            fontWeight: FontWeight.bold,
            padding: EdgeInsets.symmetric(vertical: 10),
          ),
        ],
      ),
    );
  }

  Widget _cartContentsInfo(BuildContext context, CartState cartState) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: Strings.SUBTOTAL,
                      padding: EdgeInsets.symmetric(vertical: 2),
                      fontSize: Size.SMALL,
                    ),
                    TextWidget(
                      text: '\$31.99',
                      padding: EdgeInsets.symmetric(vertical: 2),
                      fontSize: Size.SMALL,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: Strings.ESTIMATED_SHIPPING,
                      padding: EdgeInsets.symmetric(vertical: 2),
                      fontSize: Size.SMALL,
                    ),
                    TextWidget(
                      text: '--',
                      padding: EdgeInsets.symmetric(vertical: 2),
                      fontSize: Size.SMALL,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: Strings.ESTIMATED_ORDER_TOTAL,
                      padding: EdgeInsets.symmetric(vertical: 2),
                      fontSize: Size.SMALL,
                      fontWeight: FontWeight.bold,
                    ),
                    TextWidget(
                      text: '\$31.99',
                      padding: EdgeInsets.symmetric(vertical: 2),
                      fontSize: Size.SMALL,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                        text: Strings.TAX_SHOWN_REVIEW_PAGE,
                        padding: EdgeInsets.symmetric(vertical: 2),
                        fontSize: Size.SMALL,
                        fontStyle: FontStyle.italic),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _omniContent(BuildContext context, CartState cartState) {
    return Container(
      color: Colors.black12,
      padding: EdgeInsets.all(20),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: double.infinity),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextWidget(
              text: Strings.HOW_TO_GET_IT,
              fontWeight: FontWeight.bold,
              fontSize: Size.SUB_TITLE,
            ),
            Row(
              children: [
                Radio(
                  value: 0,
                  groupValue: radioChecked,
                  onChanged: _handleChangeRadio,
                  activeColor: Colors.red,
                ),
                TextWidget(
                  text: Strings.HOW_TO_GET_IT,
                  fontWeight: FontWeight.bold,
                  fontSize: Size.SMALL,
                  padding: EdgeInsets.all(0),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 24,
                  width: 48,
                  child: Radio(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: 1,
                    groupValue: radioChecked,
                    onChanged: _handleChangeRadio,
                    activeColor: Colors.red,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      TextWidget(
                        text: Strings.BUY_ONLINE_PICK_IN_STORE,
                        fontWeight: FontWeight.bold,
                        fontSize: Size.SMALL,
                        padding: EdgeInsets.all(0),
                      ),
                      TextWidget(
                        text: Strings.OMNI_ALERT,
                        fontWeight: FontWeight.normal,
                        fontSize: Size.SMALL,
                        color: Colors.red,
                        padding: EdgeInsets.symmetric(vertical: 8),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            // color: Colors.white,
                            child: Column(
                              children: [
                                Image(
                                  image: AssetImage(
                                      'assets/icons/icon-shiptome.png'),
                                ),
                                TextWidget(
                                  text: Strings.SHIP_TO_ME,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Size.SMALL,
                                  padding: EdgeInsets.all(5),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _cartLineItems(BuildContext context, CartState cartState) {
    if (cartState.selectCartItemList.length > 0) {
      List<Widget> lineItem = new List<Widget>();
      for (var i = 0; i < cartState.selectCartItemList.length; i++) {
        lineItem
            .add(new CartProductWidget(data: cartState.selectCartItemList[i]));
      }
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: lineItem,
        ),
      );
    }
    return FakeWidget();
  }

  Widget _cartHasContents(BuildContext context, CartState cartState) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SearchBarWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextWidget(
                  text: Strings.MY_SHOPPING_CART,
                  fontSize: Size.TITLE,
                  fontWeight: FontWeight.bold,
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                ),
                Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  alignment: Alignment.center,
                  child: Text(
                    cartState.selectCartItemList.length.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: Size.SUB_TITLE,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  ConstrainedBox(
                    constraints:
                        const BoxConstraints(minWidth: double.infinity),
                    child: RaisedButton(
                        color: Colors.black,
                        highlightColor: Colors.red,
                        child: TextWidget(
                          text: Strings.TAKE_ME_TO_CHECKOUT,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: Size.SUB_TITLE,
                          padding: EdgeInsets.all(10),
                        ),
                        onPressed: () {
                          print('click');
                        }),
                  ),
                  _cartContentsInfo(context, cartState),
                  _approachPromo(context, cartState),
                  _omniContent(context, cartState),
                  _cartLineItems(context, cartState),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cartEmpty(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextWidget(
            text: Strings.CART_EMPTY,
            fontSize: Size.TITLE,
            fontWeight: FontWeight.bold,
          ),
          TextClickableWidget(
            text: Strings.BACK_TO_SHOPPING,
            margin: EdgeInsets.symmetric(vertical: 10),
            onClick: () {
              Navigation(context).to(Routes.DASHBOARD);
            },
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Image(
              image: AssetImage('assets/icons/cart-red.png'),
              width: 60,
              height: 60,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        usageFor: Routes.CART,
        // onClick: _handleClickAppBar,
      ),
      body: Consumer<CartState>(
        builder: (context, cartState, child) => SafeAreaWidget(
          child: cartState.selectCartItemList.length > 0
              ? _cartHasContents(context, cartState)
              : _cartEmpty(context),
        ),
      ),
    );
  }
}
