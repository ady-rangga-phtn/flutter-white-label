import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpinnerOverlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: InkWell(
              radius: 0,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              focusColor: Colors.transparent,
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Image(
                  image: AssetImage('assets/icons/spinner-200.gif'),
                  width: 100,
                  height: 100),
            ),
          )
        ],
      ),
    );
  }
}
