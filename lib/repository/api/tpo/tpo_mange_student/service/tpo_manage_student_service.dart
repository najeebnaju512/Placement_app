import 'dart:developer';

import 'package:placement_app/core/utils/app_utils.dart';
import 'package:placement_app/repository/helper/api_helper.dart';

class TPOManageStudentService {
  static Future<dynamic> fetchData() async {
    try {
      var decodedData = await ApiHelper.getData(
          endPoint: "tpo/student/",
          header:
              ApiHelper.getApiHeader(access: await AppUtils.getAccessKey())
              );
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }
}
