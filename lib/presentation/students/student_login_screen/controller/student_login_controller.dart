import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:placement_app/presentation/students/bottom_navigation_screen/view/student_bottom_navigation_screen.dart';
import 'package:placement_app/repository/api/common/login/student_service/student_login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../config/app_config.dart';
import '../../../../core/utils/app_utils.dart';

class StudentLoginController extends ChangeNotifier {
  bool visibility = true;
  late SharedPreferences sharedPreferences;

  Future onLogin(String username, String password, BuildContext context) async {
    log("StudentLoginController -> started");
    var data = {"username": username, "password": password};
    StudentLoginService.postStudentLoginData(data).then((value) {
      log("posStudentLoginData() -> ${value["status"]}");
      if (value["status"] == 1) {
        log("token -> ${value["token"]}");
        storeLoginData(value);
        storeUserToken(value["token"]);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => StudentBottomNavigationScreen()),
            (route) => false);
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
    sharedPreferences.setBool(AppConfig.studentLoggedIn, true);
  }

  storeUserToken(resData) async {
    log("StoreUserToken");
    sharedPreferences = await SharedPreferences.getInstance();
    String dataUser = json.encode(resData);
    sharedPreferences.setString(AppConfig.token, dataUser);
  }

  void iconPressed() {
    visibility = !visibility;
    notifyListeners();
  }
}
