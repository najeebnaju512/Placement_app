import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:placement_app/repository/api/tpo/tpo_manage_company/service/manage_company_service.dart';

import '../../../../core/utils/app_utils.dart';
import '../../../../repository/api/tpo/tpo_manage_company/model/manage_company_model.dart';

class TPOManageCompanyController extends ChangeNotifier {
  TpoManageCompanyModel tpoManageCompanyModel = TpoManageCompanyModel();

  fetchCompanyList(BuildContext context) async {
    log("TPOManageCompanyController>>fetchCompanyList");

    TPOManageCompanyService.fetchData().then((resData) {
      if (resData["status"] == 1) {
        tpoManageCompanyModel = TpoManageCompanyModel.fromJson(resData);
      } else {
        AppUtils.oneTimeSnackBar("Error: Data Not Found ", context: context);
      }
      notifyListeners();
    });
  }
}
