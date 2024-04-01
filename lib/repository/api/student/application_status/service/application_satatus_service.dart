import 'dart:developer';

import 'package:placement_app/core/utils/app_utils.dart';
import 'package:placement_app/repository/helper/api_helper.dart';

class ApplicationStatusService {
  static Future<dynamic> fetchApplicationStatus() async {
    try {
      var data = ApiHelper.getData(
          endPoint: "student/applicationstatus/",
          header:
              ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
      return data;
    } catch (e) {
      log("$e");
    }
  }
}
