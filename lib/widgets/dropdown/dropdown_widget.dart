import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_white_label/constants/size.dart';

class DropdownWidget extends StatelessWidget {
  final String hintText;
  final String labelText;
  final double width;
  final Function onChanged;
  final List items;
  final bool filled;
  final Color fillColor;

  // var a = SharedPreferences.getInstance().then((prefs) => {
  //   prefs.setBool(Preferences.is_logged_in, true);
  // });

  const DropdownWidget(
      {Key key,
        this.hintText = '',
        this.labelText = '',
        this.width = 80,
        this.onChanged,
        this.items,
        this.filled,
        this.fillColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double bottomPaddingToError = 12;
    Color primaryColor = Colors.green;
    Color colorBlack = Colors.black;
    Color colorRed = Colors.red;

    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: primaryColor,
      ),
      child: Container(
          width: width,
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 12),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.zero,
                ),
                labelText: labelText,
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 1.2,
                  fontSize: Size.NORMAL,
                ),
                prefix: Padding(
                  padding: EdgeInsets.only(left: 5),
                )
            ),
            value: '1',
            items: items.map((value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList(),
            onChanged: (value) {
              if (onChanged != null) onChanged();
            },
          )),
    );
  }
}