import 'dart:developer';

import 'package:placement_app/core/utils/app_utils.dart';
import 'package:placement_app/repository/helper/api_helper.dart';

class ApplicationRecivedService {
  static Future<dynamic> fetchStudentApplication() async {
    log("ApplicationRecivedService -> started");
    try {
      var decodedData = await ApiHelper.getData(
          endPoint: "company/applications/",
          header:
              ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }

  static Future<dynamic> postInterview(Map<String, String> data, id) async {
    log("ApplicationRecivedService -> started");
    try {
      var decodedData = ApiHelper.postData(
          endPoint: "company/applications/$id/schedule_interview/",
          body: data,
          header:
              ApiHelper.getApiHeaderForException(access: await AppUtils.getAccessKey()));
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }
}
