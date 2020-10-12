import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_white_label/app_state/app_state.dart';
import 'package:provider/provider.dart';
import 'package:flutter_white_label/app_state/cart_state.dart';
import 'package:flutter_white_label/navigations/Navigation.dart';
import 'package:flutter_white_label/routes.dart';

class AppBarWidget extends PreferredSize {
  final Widget child;
  final double height;
  final Color color;
  final String usageFor;
  final Function onClick;

  AppBarWidget({
    this.usageFor,
    this.child,
    this.color,
    this.height = kToolbarHeight,
    this.onClick,
  });

  Widget _rightSideContent(BuildContext context, CartState cartState) {
    var isLoggedIn = context.watch<AppState>().selectIsLoggedIn;
    List<Widget> contents = [];
    if (usageFor == Routes.DASHBOARD) {
      contents.add(IconButton(
        padding: EdgeInsets.all(0.0),
        alignment: Alignment.center,
        icon: Icon(Icons.account_circle),
        color: Colors.black54,
        // onPressed: () {
        //   onClick(Routes.PROFILE);
        // },
        onPressed: () {
          // Navigator.pushNamed(context, Routes.LOGIN);
          if (isLoggedIn) {
            Navigation(context).to(Routes.REGISTER);
          } else {
            Navigation(context).to(Routes.LOGIN);
          }
        },
      ));
    } else if (usageFor == Routes.LOGIN || usageFor == Routes.CART) {
      contents.add(IconButton(
        padding: EdgeInsets.all(0.0),
        alignment: Alignment.centerRight,
        icon: Icon(Icons.account_circle),
        color: Colors.black54,
        onPressed: () {
          Navigation(context).to(Routes.REGISTER);
        },
      ));
      contents.add(GestureDetector(
        onTap: () {
          // Navigator.pushNamed(context, Routes.CART);
          Navigation(context).to(Routes.CART);
        },
        child: Badge(
          position: BadgePosition.topEnd(top: 4, end: 4),
          shape: BadgeShape.circle,
          badgeColor: Colors.red,
          badgeContent: Text(
            cartState.selectCartItemList.length.toString(),
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          child: IconButton(
            alignment: Alignment.centerRight,
            icon: Icon(Icons.shopping_cart),
            color: Colors.black54,
          ),
        ),
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: contents,
    );
  }

  Widget _leftSideContent(BuildContext context, CartState cartState) {
    List<Widget> contents = [
      IconButton(
        alignment: Alignment.center,
        icon: Icon(Icons.menu),
        color: Colors.black,
        onPressed: () {},
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      )
    ];
    if (usageFor == Routes.LOGIN || usageFor == Routes.CART) {
      contents.add(IconButton(
        padding: EdgeInsets.all(0.0),
        alignment: Alignment.centerLeft,
        icon: Icon(Icons.pin_drop),
        color: Colors.black54,
        onPressed: () {},
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: contents,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    // print('get current path > ${ModalRoute.of(context).settings.name}');
    // print('from custome nav > ${}')
    return Consumer<CartState>(
      builder: (context, cartState, child) => SafeArea(
        child: Container(
          height: preferredSize.height,
          alignment: Alignment.center,
          // decoration: BoxDecoration(
          //   color: color ?? Colors.white,
          //   boxShadow: <BoxShadow>[
          //     BoxShadow(
          //       color: Colors.black54,
          //       blurRadius: 5.0,
          //       spreadRadius: 0.0,
          //       offset: Offset(2, 2),
          //     ),
          //   ],
          // ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.33,
                alignment: Alignment.centerLeft,
                child: _leftSideContent(context, cartState),
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.34,
                  alignment: Alignment.centerRight,
                  child: Image(
                      image: AssetImage('assets/images/primary-logo.png'),
                      width: 150,
                      height: 50)),
              Container(
                width: MediaQuery.of(context).size.width * 0.33,
                alignment: Alignment.centerRight,
                child: _rightSideContent(context, cartState),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
