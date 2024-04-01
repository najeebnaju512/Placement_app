import 'package:placement_app/core/utils/app_utils.dart';
import 'package:placement_app/repository/helper/api_helper.dart';

class InterviewScheduleService {
  static Future<dynamic> fetchData() async {
    var data = ApiHelper.getData(
        endPoint: "tpo/scheduledinterview/",
        header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
    return data;
  }
}
