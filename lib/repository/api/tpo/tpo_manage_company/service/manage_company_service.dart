import 'dart:developer';

import '../../../../../core/utils/app_utils.dart';
import '../../../../helper/api_helper.dart';

class TPOManageCompanyService {
  static Future<dynamic> fetchData() async {
    try {
      var decodedData = await ApiHelper.getData(
          endPoint: "tpo/company/",
          header:
              ApiHelper.getApiHeader(access: await AppUtils.getAccessKey())
              );
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }
}