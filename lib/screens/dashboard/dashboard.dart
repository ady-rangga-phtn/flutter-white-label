import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_white_label/app_state/app_state.dart';
import 'package:flutter_white_label/constants/size.dart';
import 'package:flutter_white_label/constants/strings.dart';
import 'package:flutter_white_label/data/network/mock_urls.dart';
import 'package:flutter_white_label/view_models/products_view_model.dart';
import 'package:flutter_white_label/routes.dart';
import 'package:flutter_white_label/widgets/app_bar/app_bar_widget.dart';
import 'package:flutter_white_label/widgets/products_grid/products_grid_widget.dart';
import 'package:flutter_white_label/widgets/safe_area/save_area_widget.dart';
import 'package:flutter_white_label/widgets/search_bar/search_bar_widget.dart';
import 'package:flutter_white_label/widgets/text/text_widget.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  /// instance SharedPreferences service
  Future<SharedPreferences> spService = SharedPreferences.getInstance();
  SharedPreferences sp;

  @override
  void initState() {
    super.initState();
    _onStart();
  }

  void _onStart() async {
    print('onStart');
    context.read<AppState>().fetchProductList();
    sp = await spService;
  }

  void _handleClickAppBar(String key) {
    var hasLogin = sp.getBool('hasLogin') ?? false;
    if (key == Routes.PROFILE) {
      if (hasLogin) {
        print('You Has been login in');
        Navigator.pushNamed(context, Routes.PROFILE);
      } else {
        print('You has not login');
        Navigator.pushNamed(context, Routes.LOGIN);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        usageFor: Routes.DASHBOARD,
        onClick: _handleClickAppBar,
      ),
      body: Consumer<AppState>(
        builder: (context, appState, child) => SafeAreaWidget(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            padding: EdgeInsets.all(0.0),
            child: Container(
              margin: EdgeInsets.all(0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SearchBarWidget(),
                  Image(
                    image: NetworkImage(MockUrls.BANNER_IMG_URL),
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                  TextWidget(
                    text: Strings.BANNER_PROMO_INFO,
                    fontSize: Size.TITLE,
                  ),
                  ProductsGridWidget(data: appState.productList),
                ],
              ),
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
