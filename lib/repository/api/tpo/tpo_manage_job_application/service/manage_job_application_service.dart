import 'dart:developer';

import '../../../../../core/utils/app_utils.dart';
import '../../../../helper/api_helper.dart';

class TPOManageJobService {
  static Future<dynamic> fetchJobData() async {
    try {
      var decodedData = await ApiHelper.getData(
          endPoint: "tpo/application/",
          header:
              ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }

  static Future<dynamic> rejectApplication(int? uId) async {
    int id = uId!;
    var data = ApiHelper.postData(
        endPoint: "tpo/application/$id/reject_application/",
        header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
    return data;
  }

  static Future<dynamic> approveApplication(int? uId) async {
    int id = uId!;
    var data = ApiHelper.postData(
        endPoint: "tpo/application/$id/accept_application/",
        header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
    return data;
  }
}
