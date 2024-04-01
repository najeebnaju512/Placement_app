
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:placement_app/repository/api/tpo/tpo_mange_student/model/tpo_manage_student_model.dart';
import 'package:placement_app/repository/api/tpo/tpo_mange_student/service/tpo_manage_student_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/app_utils.dart';

class TPOManageStudentController extends ChangeNotifier {
  late SharedPreferences sharedPreferences;
  TpoManageStudentModel tpoManageStudentModel = TpoManageStudentModel();

  fetchStudentList(BuildContext context) async {
    log("TPOManageStudentController>>fetchStudentList");

    TPOManageStudentService.fetchData().then((resData) {
      if (resData["status"] == 1) {
        tpoManageStudentModel = TpoManageStudentModel.fromJson(resData);
      } else {
        AppUtils.oneTimeSnackBar("Error: Data Not Found ", context: context);
      }
      notifyListeners();
    });
  }


  //  fetchUserDetails() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   var uData = sharedPreferences.getString(AppConfig.loginDataKey);
  //   var data = jsonDecode(uData!)["data"];
  //   log("TransactionController >>fetch userData >> ${data}");
  //   return data;
  // }
}
