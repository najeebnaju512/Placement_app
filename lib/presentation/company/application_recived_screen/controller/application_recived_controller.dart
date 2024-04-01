import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:placement_app/core/utils/app_utils.dart';
import 'package:placement_app/repository/api/company/application_recived_screen/model/student_application_model.dart';
import 'package:placement_app/repository/api/company/application_recived_screen/service/application_recived_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApplicationRecivedController extends ChangeNotifier {
  StudentApplicationModel studentApplicationModel = StudentApplicationModel();
  late SharedPreferences sharedPreferences;
  bool isLoading = false;
  late Map<String, dynamic> header;

  fetchStudentApplication(context) async {
    isLoading = true;
    notifyListeners();
    log("ApplicationRecivedController -> fetchStudentApplication() started");
    ApplicationRecivedService.fetchStudentApplication().then((value) {
      log("fetchStudentApplication() -> status -> ${value["status"]}");
      if (value["status"] == 1) {
        log("data -> ${value["data"]}");
        studentApplicationModel = StudentApplicationModel.fromJson(value);
        log("apply_jobs_screen work aayada");
        isLoading = false;
      } else {
        AppUtils.oneTimeSnackBar("Error", context: context);
      }
      notifyListeners();
    });
  }

  scheduleInterview(BuildContext context, String date, String location, id) {
    var uId = id;
    var data = {"date_time": date, "location": location};
    ApplicationRecivedService.postInterview(data, uId).then((value) {
      log("${value['msg']}");
      if (value["status"] == 1) {
        AppUtils.oneTimeSnackBar("Successfully Scheduled Interview",
            context: context);
      } else {
        if (value['msg'] == null) {
          AppUtils.oneTimeSnackBar("Failed To Scheduled Interview",
              context: context);
        } else {
          var message = value['msg'];
          AppUtils.oneTimeSnackBar(message, context: context);
        }
      }
    });
  }
}
