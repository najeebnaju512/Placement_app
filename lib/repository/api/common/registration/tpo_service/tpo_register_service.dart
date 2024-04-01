import 'dart:developer';

import '../../../../helper/api_helper.dart';

class TpoRegisterService {

  static Future<dynamic> postTpoRegister(Map<String, dynamic> data) async{
    try {
      var decodedData = await ApiHelper.postData(
          endPoint: "tpo/register/", body: data);
      if (decodedData["status"] == 1) {
        log("TpoRegisterService>postTpoRegister>success");
        return decodedData;
      } else {
        log("${decodedData["status"]}");
        log("TpoRegisterService>postTpoRegister>failed ");
        return decodedData;
      }
    } catch (e) {
      log("$e");
    }
  }
  
}