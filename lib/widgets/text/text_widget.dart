import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatefulWidget {
  final String text;
  final EdgeInsets padding;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextDecoration decoration;
  final FontStyle fontStyle;

  const TextWidget({
    @required this.text,
    this.padding = const EdgeInsets.only(bottom: 10.0),
    this.color = Colors.black,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.left,
    this.decoration = TextDecoration.none,
    this.fontStyle = FontStyle.normal,
  });

  @override
  _TextWidgetState createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Text(widget.text,
          textAlign: widget.textAlign,
          style: TextStyle(
              decoration: widget.decoration,
              color: widget.color,
              fontSize: widget.fontSize,
              fontStyle: widget.fontStyle,
              fontWeight: widget.fontWeight)),
    );
  }
}
