import 'dart:developer';

import 'package:placement_app/repository/helper/api_helper.dart';

class TPOLoginService {
  static Future<dynamic> postTPOLoginData(Map<String, dynamic> data) async {
    try {
      var decodedData = await ApiHelper.postData(endPoint: "tpo/token/", body: data);
      if (decodedData["status"] == 1) {
        log("TPOLoginService() -> postTPOLoginData() -> success");
        return decodedData;
      } else {
        log("TPOLoginService() -> postTPOLoginData() -> failed");
        return decodedData;
      }
    } catch (e) {
      log("$e");
    }
  }
}
