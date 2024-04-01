import 'dart:developer';

import 'package:placement_app/core/utils/app_utils.dart';
import 'package:placement_app/repository/helper/api_helper.dart';

class PostJobService {
  static Future<dynamic> postJobDetails(Map<String, dynamic> data) async {
    log("PostJobService -> started");
    try {
      var decodedData = await ApiHelper.postData(
          endPoint: "company/job/", body: data, header: ApiHelper.getApiHeaderForException(access: await AppUtils.getAccessKey()));
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }
}
