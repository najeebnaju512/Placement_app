import 'dart:developer';

import '../../../../helper/api_helper.dart';

class StudentLoginService {
  static Future<dynamic> postStudentLoginData(Map<String, dynamic> data) async {
    try {
      var decodedData = await ApiHelper.postData(endPoint: "student/token/", body: data);
      if (decodedData["status"] == 1) {
        log("StudentLoginService() -> postStudentLoginData() -> success");
        return decodedData;
      } else {
        log("StudentLoginService() -> postStudentLoginData() -> failed");
        return decodedData;
      }
    } catch (e) {
      log("$e");
    }
  }
}
