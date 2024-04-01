import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:placement_app/presentation/students/student_login_screen/view/student_login_screen.dart';
import 'package:placement_app/repository/api/common/registration/student_service/student_service.dart';

import '../../../../../core/utils/app_utils.dart';

class StudentRegController extends ChangeNotifier {
  void onRegister(BuildContext context, String username, String firstname, String lastname, String phoneno, String mail,
      String pass) async {
    var data = {
      "First_name": firstname,
      "Last_name": lastname,
      "phone_no": phoneno,
      "email_address": mail,
      "username": username,
      "password": pass,
    };
    StudentRegisterService.postStudentRegister(data).then((resData) {
      log("onRegister ${resData["status"]}");
      if (resData["status"] == 1) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StudentLoginScreen()));
      } else {
        var message = resData["msg"];
        AppUtils.oneTimeSnackBar(message, context: context);
      }
    });
  }
}
