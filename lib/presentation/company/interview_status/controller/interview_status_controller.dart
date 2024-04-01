import 'package:flutter/material.dart';
import 'package:placement_app/core/utils/app_utils.dart';
import 'package:placement_app/repository/api/company/interview_status/model/interview_status_model.dart';
import 'package:placement_app/repository/api/company/interview_status/service/interview_status_service.dart';

class InterviewStatusController extends ChangeNotifier {
  InterviewStatusModel interviewStatusModel = InterviewStatusModel();

  fetchData(BuildContext context) {
    InterviewStatusService.fetchDataInterview().then((resData) {
      if (resData["status"] == 1) {
        interviewStatusModel = InterviewStatusModel.fromJson(resData);
      } else {
        AppUtils.oneTimeSnackBar("Error:Data Not Found", context: context);
      }
      notifyListeners();
    });
  }
}
