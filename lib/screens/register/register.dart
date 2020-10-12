import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_white_label/constants/size.dart';
import 'package:flutter_white_label/constants/strings.dart';
import 'package:flutter_white_label/routes.dart';
import 'package:flutter_white_label/widgets/app_bar/app_bar_widget.dart';
import 'package:flutter_white_label/widgets/button/button_widget.dart';
import 'package:flutter_white_label/widgets/input_field/input_field_widget.dart';
import 'package:flutter_white_label/widgets/safe_area/save_area_widget.dart';
import 'package:flutter_white_label/widgets/text/text_widget.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        usageFor: Routes.REGISTER,
      ),
      body: SafeAreaWidget(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 20),
            child: Container(
              margin: EdgeInsets.fromLTRB(40, 20, 40, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextWidget(
                    text: Strings.CREATE_ACCOUNT,
                    fontSize: Size.TITLE,
                    fontWeight: FontWeight.bold,
                  ),
                  TextWidget(text: Strings.REGISTER_INFO1),
                  TextWidget(text: Strings.REGISTER_INFO2),
                  Form(
                      child: Column(
                    children: <Widget>[
                      InputFieldWidget(
                        hintText: "First Name*",
                        obscureText: true,
                        textInputType: TextInputType.text,
                        functionValidate: commonValidation,
                      ),
                      InputFieldWidget(
                        hintText: "Last Name*",
                        obscureText: true,
                        textInputType: TextInputType.text,
                        functionValidate: commonValidation,
                      ),
                      InputFieldWidget(
                        hintText: "Email address**",
                        obscureText: true,
                        textInputType: TextInputType.emailAddress,
                        functionValidate: commonValidation,
                      ),
                      ButtonWidget(
                        text: Strings.CREATE_ACCOUNT,
                        minWidth: 250,
                        margin: EdgeInsets.symmetric(vertical: 50),
                        onClick: () {
                          Navigator.pushNamed(context, Routes.DASHBOARD);
                        },
                      ),
                    ],
                  ))
                ],
              ),
            )),
      ),
    );
  }
}
