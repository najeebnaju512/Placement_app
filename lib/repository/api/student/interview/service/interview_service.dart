import 'dart:developer';

import 'package:placement_app/core/utils/app_utils.dart';
import 'package:placement_app/repository/helper/api_helper.dart';

class InterviewService {
  static Future<dynamic> fetchData() async {
    try {
      var decodeddData = ApiHelper.getData(
          endPoint: "student/interviews/",
          header:
              ApiHelper.getApiHeaderForException(access: await AppUtils.getAccessKey()));
      return decodeddData;
    } catch (e) {
      log("$e");
    }
  }
}
