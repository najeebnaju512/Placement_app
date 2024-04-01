import 'dart:developer';

import '../../../../helper/api_helper.dart';

class StudentRegisterService {
  static Future<dynamic> postStudentRegister(Map<String, dynamic> data) async {
    try {
      var decodedData =
          await ApiHelper.postData(endPoint: "student/signup/", body: data);
      if (decodedData["status"] == 1) {
        log("StudentService>studentRegister>success");
        return decodedData;
      } else {
        log("${decodedData["status"]}");
        log("StudentService>studentRegister>failed ");
        return decodedData;
      }
    } catch (e) {
      log("$e");
    }
  }
}
