import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:placement_app/core/utils/app_utils.dart';
import 'package:placement_app/repository/api/student/application_status/model/application_status_model.dart';
import 'package:placement_app/repository/api/student/application_status/service/application_satatus_service.dart';

class ApplicationStatusController extends ChangeNotifier {
  ApplicationStatusModel applicationStatusModel = ApplicationStatusModel();
  fetchData(context) {
    ApplicationStatusService.fetchApplicationStatus().then((value) {
      if (value['status'] == 1) {
        log("ApplicationStatusController>>>>>>>>>>${value['data']}");
        applicationStatusModel = ApplicationStatusModel.fromJson(value);
      } else {
        AppUtils.oneTimeSnackBar("Error: data not found", context: context);
      }
      notifyListeners();
    });
  }
}
