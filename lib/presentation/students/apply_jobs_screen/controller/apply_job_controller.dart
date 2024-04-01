import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:placement_app/core/utils/app_utils.dart';
import 'package:placement_app/repository/api/student/apply_jobs_screen/model/apply_jobs_model.dart';
import 'package:placement_app/repository/api/student/apply_jobs_screen/service/apply_jobs_service.dart';

class ApplyJobsController extends ChangeNotifier {
  ApplyJobsModel applyJobsModel = ApplyJobsModel();
  bool isLoading = false;

  fetchApplyJobs(context) async {
    isLoading = true;
    notifyListeners();
    log("ApplyJobsController -> fetchApplyJobs");
    ApplyJobsService.fetchApplyJobs().then((value) {
      log("ApplyJobsService.fetchApplyJobs() -> started");
      if (value["status"] == 1) {
        log("data -> ${value["data"]}");
        applyJobsModel = ApplyJobsModel.fromJson(value);
        isLoading = false;
      } else {
        AppUtils.oneTimeSnackBar("error", context: context);
      }
      notifyListeners();
    });
  }

  postApplyJob(context, id) async {
    log("ApplyJobsController -> postApplyJob");
    ApplyJobsService.postApplyJob(id).then((value) {
      log("ApplyJobsService.postApplyJob(id) -> started");
      if (value["status"] == 1) {
        log("data -> ${value["status"]}");
        AppUtils.oneTimeSnackBar("Applied", context: context);
      } else {
       if (value['msg'] == null) {
          AppUtils.oneTimeSnackBar("Failed To Apply",
              context: context);
        } else {
          var message = value['msg'];
          AppUtils.oneTimeSnackBar(message, context: context);
        }
      }
      notifyListeners();
    });
  }
}
