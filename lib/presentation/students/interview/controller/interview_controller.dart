import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:placement_app/core/utils/app_utils.dart';
import 'package:placement_app/repository/api/student/interview/model/interview_model.dart';
import 'package:placement_app/repository/api/student/interview/service/interview_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InterviewController extends ChangeNotifier {
  late SharedPreferences sharedPreferences;
  InterviewModel interviewModel = InterviewModel();
  late String? token;

  fetchData(BuildContext context) {
    InterviewService.fetchData().then((resData) async {
      if (resData["status"] == 1) {
        log("message==================${resData["data"]}");
        interviewModel = InterviewModel.fromJson(resData);
        notifyListeners();
      } else {
        AppUtils.oneTimeSnackBar("Error: data not found", context: context);
      }
      notifyListeners();
    });
  }
}
