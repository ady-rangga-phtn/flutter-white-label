import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_white_label/routes.dart';
import 'package:flutter_white_label/widgets/app_bar/app_bar_widget.dart';
import 'package:flutter_white_label/widgets/safe_area/save_area_widget.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  /// instance SharedPreferences service
  Future<SharedPreferences> spService = SharedPreferences.getInstance();
  SharedPreferences sp;


  @override
  void initState() {
    super.initState();
    instanceSP();
  }

  void instanceSP() async {
    sp = await spService;
  }

  void _handleClickAppBar(String key) {
    print('_handleClickAppBar > $key');
    // var hasLogin = sp.getBool('hasLogin') ?? false;
    // print('hasLogin > $hasLogin');
    // if (key == 'profile') {
    //   if (hasLogin) {
    //     print('You Has been login in');
    //   } else {
    //     print('You has not login');
    //     Navigator.pushNamed(context, Routes.login);
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        usageFor: Routes.PROFILE,
        onClick: _handleClickAppBar,
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
                    child: Text(
                      'Profile',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
