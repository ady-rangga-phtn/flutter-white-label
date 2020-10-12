import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_white_label/constants/size.dart';

class TextClickableWidget extends StatelessWidget {
  final String text;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Function onClick;

  const TextClickableWidget(
      {Key key,
      @required this.text,
      this.padding,
      this.margin,
      @required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 100,
      // splashColor: Colors.transparent,
      // highlightColor: Colors.transparent,
      // focusColor: Colors.transparent,
      onTap: onClick ?? () {},
      child: Container(
        // padding: padding ?? EdgeInsets.all(8.0),
        margin: margin ?? EdgeInsets.all(0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.chevron_left,
              size: 30,
              color: Colors.black,
            ),
            Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: Size.NORMAL,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}
