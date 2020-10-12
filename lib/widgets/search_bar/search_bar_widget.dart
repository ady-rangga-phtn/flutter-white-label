import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_white_label/constants/size.dart';
import 'package:flutter_white_label/constants/strings.dart';

class SearchBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black12,
        padding: EdgeInsets.symmetric(horizontal: 5.0),
        margin: EdgeInsets.fromLTRB(0, 8, 0, 16),
        // width: double.infinity,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(Icons.search, size: 25),
            ),
            Flexible(
              child: TextField(
                onEditingComplete: () {
                  print('searching...');
                  FocusScope.of(context).unfocus();
                },
                textInputAction: TextInputAction.go,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: Strings.SEARCH_BAR_LABEL,
                    hintStyle:
                        TextStyle(color: Colors.grey, fontSize: Size.NORMAL)),
                style: TextStyle(fontSize: Size.NORMAL),
              ),
            ),
          ],
        ));
  }
}
