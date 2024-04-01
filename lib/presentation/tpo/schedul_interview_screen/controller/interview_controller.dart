import 'package:flutter/material.dart';
import 'package:placement_app/repository/api/tpo/schedule_interview_screen/model/interview_model.dart';
import 'package:placement_app/repository/api/tpo/schedule_interview_screen/services/interview_service.dart';

import '../../../../core/utils/app_utils.dart';

class InterviewScheduleController extends ChangeNotifier {
  InterviewScheduleModel interviewScheduleModel = InterviewScheduleModel();

  fetchDetails(context) {
    InterviewScheduleService.fetchData().then((data) {
      if (data["status"] == 1) {
        interviewScheduleModel = InterviewScheduleModel.fromJson(data);
      } else {
        AppUtils.oneTimeSnackBar("Error: Data Not Found", context: context);
      }
      notifyListeners();
    });
  }
}
