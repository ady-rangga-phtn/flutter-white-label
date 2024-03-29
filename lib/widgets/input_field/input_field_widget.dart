import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_white_label/constants/color_palette.dart';

/// *  textInputType - The type of information for which to optimize the text input control.
/// *  hintText - Text that suggests what sort of input the field accepts.
/// *  prefixIcon - Pass Icon if required
/// *  defaultText - If there is predefined value is there for a text field
/// *  focusNode - Currently focus node
/// *  obscureText - Is Password field?
/// *  controller - Text controller
/// *  functionValidate - Validation function(currently I have used to check empty field)
/// *  parametersValidate - Value to validate
/// *  actionKeyboard - Keyboard action eg. next, done, search, etc
/// *  onSubmitField - Done click action
/// *  onFieldTap - On focus on TextField
class InputFieldWidget extends StatefulWidget {
  final TextInputType textInputType;
  final String hintText;
  final Widget prefixIcon;
  final String defaultText;
  final FocusNode focusNode;
  final bool obscureText;
  final TextEditingController controller;
  final Function functionValidate;
  final String parametersValidate;
  final TextInputAction actionKeyboard;
  final Function onSubmitField;
  final Function onFieldTap;
  final Function onSaved;

  const InputFieldWidget(
      {@required this.hintText,
        this.focusNode,
        this.textInputType,
        this.defaultText,
        this.obscureText = false,
        this.controller,
        this.functionValidate,
        this.parametersValidate,
        this.actionKeyboard = TextInputAction.next,
        this.onSubmitField,
        this.onFieldTap,
        this.prefixIcon,
        this.onSaved});

  @override
  _InputFieldWidgetState createState() => _InputFieldWidgetState();
}

class _InputFieldWidgetState extends State<InputFieldWidget> {
  double bottomPaddingToError = 12;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: ColorPalette.primaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: TextFormField(
          cursorColor: ColorPalette.primaryColor,
          obscureText: widget.obscureText,
          keyboardType: widget.textInputType,
          textInputAction: widget.actionKeyboard,
          focusNode: widget.focusNode,
          style: TextStyle(
            color: Colors.black,
            // fontSize: 16.0,
            // fontWeight: FontWeight.w200,
            fontStyle: FontStyle.normal,
            // letterSpacing: 1.2,
          ),
          initialValue: widget.defaultText,
          decoration: InputDecoration(
            labelText: widget.hintText,
            labelStyle: TextStyle(color: Colors.grey),
            prefixIcon: widget.prefixIcon,
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: Colors.grey,
              // fontSize: 14.0,
              // fontWeight: FontWeight.w300,
              // fontStyle: FontStyle.normal,
              // letterSpacing: 1.2,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorPalette.primaryColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorPalette.primaryColor),
            ),
            // contentPadding: EdgeInsets.only(
            //     top: 12, bottom: bottomPaddingToError, left: 8.0, right: 8.0),
            isDense: true,
            errorStyle: TextStyle(
              color: Colors.red,
              // fontSize: 12.0,
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.normal,
              letterSpacing: 1.2,
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorPalette.primaryColor),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorPalette.primaryColor),
            ),
          ),
          controller: widget.controller,
          validator: (value) {
            if (widget.functionValidate != null) {
              String resultValidate =
              widget.functionValidate(value);
              // widget.functionValidate(value, widget.parametersValidate);
              if (resultValidate != null) {
                return resultValidate;
              }
            }
            return null;
          },
          onFieldSubmitted: (value) {
            if (widget.onSubmitField != null) widget.onSubmitField();
          },
          onTap: () {
            if (widget.onFieldTap != null) widget.onFieldTap();
          },
          onSaved: (value) {
            if (widget.onSaved != null) widget.onSaved(value);
          },
        ),
      ),
    );
  }
}

String commonValidation(String value, String messageError) {
  var required = requiredValidator(value, messageError);
  if (required != null) {
    return required;
  }
  return null;
}

String requiredValidator(value, messageError) {
  if (value.isEmpty) {
    return messageError;
  }
  return null;
}

void changeFocus(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}