import 'dart:developer';

import '../../../../helper/api_helper.dart';

class CompanyLoginService {
  static Future<dynamic> postCompanyLoginData(Map<String, dynamic> data) async {
    try {
      var decodedData = await ApiHelper.postData(endPoint: "company/token/", body: data);
      if (decodedData["status"] == 1) {
        log("CompanyLoginService() -> postCompanyLoginData() -> success");
        return decodedData;
      } else {
        log("CompanyLoginService() -> postCompanyLoginData() -> failed");
        return decodedData;
      }
    } catch (e) {
      log("$e");
    }
  }
}
