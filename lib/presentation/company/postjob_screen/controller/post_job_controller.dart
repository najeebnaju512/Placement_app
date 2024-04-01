import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:placement_app/core/utils/app_utils.dart';
import 'package:placement_app/repository/api/company/post_job_screen/service/post_job_service.dart';

class PostJobController extends ChangeNotifier {
  Future onPostJob(
    String position,
    String description,
    String requirements,
    String location,
    String salary,
    String deadline,
    BuildContext context,
  ) async {
    var data = {
      "position": position,
      "description": description,
      "requirements": requirements,
      "location": location,
      "salary": salary,
      "deadline": deadline,
    };
    PostJobService.postJobDetails(data).then((value) {
      log("PostJobController -> status -> ${value["status"]}");
      if (value["status"] == 1) {
        log("${value["data"]}");
        AppUtils.oneTimeSnackBar("Job Posted Successfully", context: context);
      } else {
        AppUtils.oneTimeSnackBar("Failed", context: context);
      }
    });
  }
}
