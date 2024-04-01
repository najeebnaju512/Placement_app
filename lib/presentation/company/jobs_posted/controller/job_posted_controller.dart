import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:placement_app/core/utils/app_utils.dart';
import 'package:placement_app/repository/api/company/jobs_posted/model/job_posted_model.dart';
import 'package:placement_app/repository/api/company/jobs_posted/service/jobs_posted_service.dart';

class JobsPostedController extends ChangeNotifier {
  PostedJobsModel postedJobsModel = PostedJobsModel();
  bool isLoading = false;

  fetchJobsPosted(context)async{
    isLoading = true;
    notifyListeners();
    log("JobsPostedController -> fetchJobsPosted");
    JobsPostedService.fetchJobsPosted().then((value) {
      log("JobsPostedService.fetchJobsPosted() started");
      if(value ["status"]== 1){
        log("data====================================== -> ${value["data"]}");
        postedJobsModel = PostedJobsModel.fromJson(value);
        isLoading = false;
      }else{
        AppUtils.oneTimeSnackBar("error", context: context);
      }
      notifyListeners();
    });
  }
}