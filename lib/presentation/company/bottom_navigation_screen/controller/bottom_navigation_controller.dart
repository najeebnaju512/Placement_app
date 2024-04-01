import 'package:flutter/material.dart';
import 'package:placement_app/presentation/company/application_recived_screen/view/application_recived_screen.dart';
import 'package:placement_app/presentation/company/interview_status/view/interview_status_screen.dart';
import 'package:placement_app/presentation/company/postjob_screen/view/post_job_screen.dart';

import '../../jobs_posted/view/jobs_posted_screen.dart';

class CompanyBottomController with ChangeNotifier {
  int selectedIndex = 0;

  void onItemTap(index) {
    selectedIndex = index;
    notifyListeners();
  }

  List<Widget> screens = [
    ApplicationRecived(),
    PostJobScreen(),
    JobsPostedScreen(),
    InterviewStatusScreen()
  ];
}
