import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:placement_app/config/app_config.dart';
import 'package:placement_app/core/utils/app_utils.dart';
import 'package:placement_app/presentation/tpo/bottom_navigation_screen/view/bottom_navigation_screen.dart';
import 'package:placement_app/repository/api/common/login/tpo_service/tpo_login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TPOLoginController extends ChangeNotifier {
  bool visibility = true;
  late SharedPreferences sharedPreferences;

  Future onLogin(String username, String password, BuildContext context) async {
    log("TPOLoginController -> started");
    var data = {"username": username, "password": password};
    TPOLoginService.postTPOLoginData(data).then((resData) {
      log("posTPOLoginData() -> ${resData["status"]}");
      if (resData["status"] == 1) {
        log("token -> ${resData["token"]}");
        Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (context) => TPOBottomNavigationScreen()), (route) => false);
        storeLoginData(resData);
        storeUserToken(resData);
      } else {
        var message = resData["non_field_errors"].toString();
        AppUtils.oneTimeSnackBar(message, context: context);
      }
    });
  }

  void storeLoginData(loginReceivedData) async {
    log("storeLoginData()");
    sharedPreferences = await SharedPreferences.getInstance();
    String storeData = jsonEncode(loginReceivedData);
    sharedPreferences.setString(AppConfig.loginDataKey, storeData);
    sharedPreferences.setBool(AppConfig.tpoLoggedIn, true);
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
