import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_white_label/constants/size.dart';
import 'package:flutter_white_label/widgets/text/text_widget.dart';
import 'package:intl/intl.dart';

class TextPricingWidget extends StatelessWidget {
  final String text;
  final EdgeInsets padding;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextDecoration decoration;
  final bool isLineThrough;

  TextPricingWidget({
    @required this.text,
    this.padding = const EdgeInsets.symmetric(vertical: 10.0),
    this.color = Colors.black,
    this.fontSize = Size.NORMAL,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.left,
    this.decoration = TextDecoration.none,
    this.isLineThrough = false,
  });

  String _currencyFormat(String str) {
    if (str.isEmpty) return '';
    int strSize = str.length;
    int fixed = int.parse(str.substring(0, strSize - 2));
    String cents = str.substring(strSize - 2, strSize);
    String dollars = new NumberFormat.simpleCurrency(decimalDigits: 0).format(fixed);
    String formatted = '$dollars.$cents';
    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    return TextWidget(
      text: _currencyFormat(text),
      padding: padding,
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      textAlign: textAlign,
      decoration: isLineThrough ? TextDecoration.lineThrough : null,
    );
  }
}
