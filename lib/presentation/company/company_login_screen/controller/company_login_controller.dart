import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:placement_app/repository/api/common/login/company_service/company_login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../config/app_config.dart';
import '../../../../core/utils/app_utils.dart';
import '../../bottom_navigation_screen/view/company_bottom_navigation_screen.dart';

class CompanyLoginController extends ChangeNotifier {
  bool visibility = true;
  late SharedPreferences sharedPreferences;

  Future onLogin(String username, String password, BuildContext context) async {
    log("CompanyLoginController -> started");
    var data = {"username": username, "password": password};
    CompanyLoginService.postCompanyLoginData(data).then((value) {
      log("postCompanyLoginData() -> ${value["status"]}");
      if (value["status"] == 1) {
        log("token -> ${value["token"]}");
        storeUserToken(value);
        storeLoginData(value);
        Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (context) => CompanyBottomNavigationScreen()), (route) => false);
      } else {
        var message = value["non_field_errors"].toString();
        AppUtils.oneTimeSnackBar(message, context: context);
      }
    });
  }

  void storeLoginData(loginReceivedData) async {
    log("storeLoginData()");
    sharedPreferences = await SharedPreferences.getInstance();
    String storeData = jsonEncode(loginReceivedData);
    sharedPreferences.setString(AppConfig.loginDataKey, storeData);
    sharedPreferences.setBool(AppConfig.companyLoggedIn, true);
  }

  storeUserToken(resData) async {
    log("StoreUserToken");
    sharedPreferences = await SharedPreferences.getInstance();
    String dataUser = json.encode(resData["token"]);
    sharedPreferences.setString(AppConfig.token, dataUser);
  }

  void iconPressed() {
    visibility = !visibility;
    notifyListeners();
  }
}
