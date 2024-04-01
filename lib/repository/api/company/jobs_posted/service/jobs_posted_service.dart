import 'dart:developer';

import 'package:placement_app/core/utils/app_utils.dart';
import 'package:placement_app/repository/helper/api_helper.dart';

class JobsPostedService {
  static Future <dynamic> fetchJobsPosted() async{
    log("JobsPostedService -> started");
    try{
      var decodedData = await ApiHelper.getData(endPoint: "company/job/",header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
      return decodedData;
    }catch(e){
      log("$e");
    }
  }
}