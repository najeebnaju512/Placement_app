import 'dart:developer';

import 'package:placement_app/core/utils/app_utils.dart';
import 'package:placement_app/repository/helper/api_helper.dart';

class InterviewStatusService {
  static Future<dynamic> fetchDataInterview() async {
    try {
      var data = ApiHelper.getData(
          endPoint: "company/scheduledinterview/",
          header:
              ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
      return data;
    } catch (e) {
      log("$e");
    }
  }
}
