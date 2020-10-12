import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SafeAreaWidget extends StatefulWidget {
  final Widget child;
  final Function onTap;

  const SafeAreaWidget({Key key, @required this.child, this.onTap})
      : super(key: key);

  @override
  _SafeAreaWidgetState createState() => _SafeAreaWidgetState();
}

class _SafeAreaWidgetState extends State<SafeAreaWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: InkWell(
        radius: 0,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        onTap: widget.onTap ?? () {},
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: widget.child,
              ),
            )
          ],
        ),
      ),
    );
  }
}
