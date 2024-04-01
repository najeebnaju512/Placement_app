import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:placement_app/presentation/tpo/tpo_login_screen/view/tpo_login_screen.dart';
import 'package:placement_app/repository/api/common/registration/tpo_service/tpo_register_service.dart';

import '../../../../../core/utils/app_utils.dart';

class TpoRegisterController extends ChangeNotifier {
  void onRegister(
    BuildContext context,
    String username,
    String name,
    String phone,
    String mail,
    String pass,
  ) {
    var data = {
      "name": name,
      "phone_no": phone,
      "email_address": mail,
      "username": username,
      "password": pass,
    };
    TpoRegisterService.postTpoRegister(data).then((resData) {
      log("onRegister ${resData["status"]}");
      if (resData["status"] == 1) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TPOLoginScreen()));
      } else {
        var message = resData["msg"];
        AppUtils.oneTimeSnackBar(message, context: context);
      }
    });
  }
}
