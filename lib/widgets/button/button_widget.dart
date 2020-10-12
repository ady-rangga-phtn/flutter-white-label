import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  final double minWidth;
  final VoidCallback onClick;
  final String text;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;

  const ButtonWidget(
      {@required this.text,
      this.onClick,
      this.padding,
      this.minWidth,
      this.margin,
      this.backgroundColor = Colors.red,
      this.borderColor = Colors.red,
      this.textColor = Colors.white});

  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: widget.margin ?? EdgeInsets.all(0.0),
          child: ButtonTheme(
            minWidth: widget.minWidth ?? 0,
            child: RaisedButton(
              onPressed: widget.onClick ?? () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
                side: BorderSide(color: widget.borderColor, width: 0.8),
              ),
              textColor: Colors.white,
              color: widget.backgroundColor,
              child: Padding(
                padding: widget.padding ??
                    EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                child: Text(
                  widget.text.toUpperCase() ?? '',
                  style: TextStyle(
                    color: widget.textColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
