import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_white_label/constants/size.dart';
import 'package:flutter_white_label/widgets/text/text_widget.dart';

class TextLinkWidget extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign textAlign;
  final EdgeInsets padding;
  final FontWeight fontWeight;
  final double fontSize;
  final TextDecoration decoration;
  final Function onClick;

  const TextLinkWidget(
      {Key key,
        this.text = '',
        this.color = Colors.red,
        this.textAlign = TextAlign.left,
        this.padding,
        this.fontWeight = FontWeight.normal,
        this.fontSize = Size.SMALL,
        this.decoration = TextDecoration.underline,
        this.onClick,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick ?? () {
        print('click text link $text');
      },
      child: TextWidget(
        text: text,
        color: color,
        textAlign: textAlign,
        // padding: EdgeInsets.symmetric(horizontal: 20),
        fontWeight: fontWeight,
        decoration: decoration,
        fontSize: fontSize,
      ),
    );
  }
}