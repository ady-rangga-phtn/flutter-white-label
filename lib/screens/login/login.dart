import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_white_label/app_state/app_state.dart';
import 'package:provider/provider.dart';
import 'package:flutter_white_label/constants/size.dart';
import 'package:flutter_white_label/constants/strings.dart';
import 'package:flutter_white_label/view_models/accounts_view_model.dart';
import 'package:flutter_white_label/routes.dart';
import 'package:flutter_white_label/utils/validation_form.dart';
import 'package:flutter_white_label/widgets/app_bar/app_bar_widget.dart';
import 'package:flutter_white_label/widgets/button/button_widget.dart';
import 'package:flutter_white_label/widgets/fake/fake_widget.dart';
import 'package:flutter_white_label/widgets/input_field/input_field_widget.dart';
import 'package:flutter_white_label/widgets/safe_area/save_area_widget.dart';
import 'package:flutter_white_label/widgets/spinner/spinner_overlay.dart';
import 'package:flutter_white_label/widgets/text/text_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<LoginScreen> with ValidationForm {
  final formKey = GlobalKey<FormState>();

  /// instance SharedPreferences service
  // Future<SharedPreferences> spService = SharedPreferences.getInstance();
  // SharedPreferences sp;

  /// state variable
  String email = '';
  String password = '';
  bool showErrorLogin = false;

  @override
  void initState() {
    super.initState();
  }

  void _loginButtonHandler(BuildContext context) {
    FocusScope.of(context).unfocus();
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      setState(() {
        showErrorLogin = false;
      });
      _validateUserLogin();
    } else {
      setState(() {
        showErrorLogin = true;
      });
    }
  }

  void _validateUserLogin() async {
    showDialog(
      context: context,
      builder: (BuildContext context) => SpinnerOverlay(),
    );
    var check = await AccountsViewModel().authorized(email, password);
    print('userLog > $email $password $check');
    Navigator.of(context).pop();
    if (check.length == 1) {
      print('login valid: $check');
      context.read<AppState>().dispatchIsLoggedIn(true);
      Navigator.pushNamed(context, Routes.DASHBOARD);
    } else {
      print('login not valid: $check');
    }
    // Navigator.pop(context);
  }

  /// WIDGETS SECTION

  Widget _errorMessageWidget(BuildContext context) {
    if (showErrorLogin)
      return TextWidget(
        text: Strings.LOGIN_FAILED_MESSAGE,
        padding: EdgeInsets.symmetric(vertical: 20),
        color: Colors.red,
      );
    return FakeWidget();
  }

  Widget _textForgotPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
          child: Text(Strings.FORGOT_PASSWORD,
              style: TextStyle(color: Colors.blue)),
        )
      ],
    );
  }

  /// return ui for new customer contents ui
  Widget _newCustomerWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 80, 0, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextWidget(
            text: Strings.NEW_CUSTOMER,
            fontSize: Size.TITLE,
            fontWeight: FontWeight.bold,
          ),
          TextWidget(
            text: Strings.NEW_CUSTOMER_INFO,
            fontWeight: FontWeight.w500,
          ),
          ButtonWidget(
            text: Strings.CREATE_ACCOUNT,
            textColor: Colors.red,
            minWidth: 250,
            backgroundColor: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 30),
            onClick: () {
              Navigator.pushNamed(context, Routes.REGISTER);
            },
          ),
          TextWidget(
            text: Strings.BENEFITS_CREATING,
            fontSize: Size.SUB_TITLE,
            fontWeight: FontWeight.bold,
          ),
          TextWidget(
            text: Strings.NEWS_AND_EXCLUSIVE_OFFERS,
            fontSize: Size.NORMAL,
            fontWeight: FontWeight.bold,
          ),
          TextWidget(
            text: Strings.NEWS_AND_EXCLUSIVE_OFFERS_INFO,
            fontSize: Size.DEFAULT,
          ),
          TextWidget(
            text: Strings.ORDER_HISTORY,
            fontSize: Size.NORMAL,
            fontWeight: FontWeight.bold,
          ),
          TextWidget(
            text: Strings.ORDER_HISTORY_INFO,
            fontSize: Size.DEFAULT,
          ),
          TextWidget(
            text: Strings.FASTER_CHECKOUT,
            fontSize: Size.NORMAL,
            fontWeight: FontWeight.bold,
          ),
          TextWidget(
            text: Strings.FASTER_CHECKOUT_INFO,
            fontSize: Size.DEFAULT,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        usageFor: Routes.LOGIN,
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(Strings.RETURNING_CUSTOMERS,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w700)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(Strings.ASTERISK_REQUIRED,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w700)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(Strings.LOGIN_INFO_TEXT,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w700)),
                  ),
                  _errorMessageWidget(context),
                  Form(
                      key: formKey,
                      child: Column(
                        children: <Widget>[
                          InputFieldWidget(
                            hintText: Strings.EMAIL_HINT_TEXT,
                            textInputType: TextInputType.emailAddress,
                            functionValidate: validateEmail,
                            onSaved: (String value) {
                              email = value;
                            },
                            onSubmitField: () {
                              FocusScope.of(context).nextFocus();
                            },
                          ),
                          InputFieldWidget(
                            obscureText: true,
                            hintText: Strings.PASSWORD_ASTERISK,
                            textInputType: TextInputType.visiblePassword,
                            functionValidate: validatePassword,
                            onSaved: (String value) {
                              password = value;
                            },
                            onSubmitField: () {
                              _loginButtonHandler(context);
                            },
                            actionKeyboard: TextInputAction.go
                          ),
                          _textForgotPassword(),
                          ButtonWidget(
                            text: Strings.LOGIN,
                            minWidth: 250,
                            onClick: () {
                              _loginButtonHandler(context);
                            },
                          ),
                        ],
                      )),
                  _newCustomerWidget(context),
                ],
              ),
            )),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
