import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:placement_app/repository/api/tpo/tpo_manage_job_application/model/manage_job_application_model.dart';
import 'package:placement_app/repository/api/tpo/tpo_manage_job_application/service/manage_job_application_service.dart';

import '../../../../core/utils/app_utils.dart';

class TPOManageJobController extends ChangeNotifier {
  TpoManageJobModel tpoManageJobModel = TpoManageJobModel();

  fetchJobData(context) {
    TPOManageJobService.fetchJobData().then((resData) {
      log("TPOManageJobController>>fetchJobData");
      if (resData["status"] == 1) {
        // log("----------------$resData");
        tpoManageJobModel = TpoManageJobModel.fromJson(resData);
      } else {
        AppUtils.oneTimeSnackBar("Error: Data Not Found ", context: context);
      }
      notifyListeners();
    });
  }

  onReject(BuildContext context, {int? id}) {
    TPOManageJobService.rejectApplication(id).then((data) {
      if (data["status"] == 1) {
        var message = data["msg"];
        AppUtils.oneTimeSnackBar(message, context: context);
      } else {
        AppUtils.oneTimeSnackBar("Error: Application Can't be Rejected ",
            context: context);
      }
      notifyListeners();
    });
  }

  onApprove(BuildContext context, {int? id}) {
    TPOManageJobService.approveApplication(id).then((data) {
      if (data["status"] == 1) {
        var message = data["msg"];
        AppUtils.oneTimeSnackBar(message, context: context);
      } else {
        AppUtils.oneTimeSnackBar("Application hasn't Approved",
            context: context);
      }
      notifyListeners();
    });
  }
}
