import 'package:flutter/material.dart';
import 'package:placement_app/presentation/common/registration/company/controller/company_register_controller.dart';
import 'package:placement_app/presentation/common/registration/student/controller/student_register_controller.dart';
import 'package:placement_app/presentation/common/registration/tpo/controller/tpo_register_controller.dart';
import 'package:placement_app/presentation/common/splash_screen/view/splash_screen.dart';
import 'package:placement_app/presentation/company/bottom_navigation_screen/controller/bottom_navigation_controller.dart';
import 'package:placement_app/presentation/company/company_login_screen/controller/company_login_controller.dart';
import 'package:placement_app/presentation/company/application_recived_screen/controller/application_recived_controller.dart';
import 'package:placement_app/presentation/company/interview_status/controller/interview_status_controller.dart';
import 'package:placement_app/presentation/company/jobs_posted/controller/job_posted_controller.dart';
import 'package:placement_app/presentation/company/postjob_screen/controller/post_job_controller.dart';
import 'package:placement_app/presentation/students/applicatioon_status/controller/application_status_controller.dart';
import 'package:placement_app/presentation/students/apply_jobs_screen/controller/apply_job_controller.dart';
import 'package:placement_app/presentation/students/bottom_navigation_screen/controller/student_bottom_navigation_controller.dart';
import 'package:placement_app/presentation/students/interview/controller/interview_controller.dart';
import 'package:placement_app/presentation/students/student_login_screen/controller/student_login_controller.dart';
import 'package:placement_app/presentation/tpo/bottom_navigation_screen/controller/bottom_navigation_controller.dart';
import 'package:placement_app/presentation/tpo/manage_company_screen/controller/manage_company_controller.dart';
import 'package:placement_app/presentation/tpo/manage_job_req_screen/controller/manage_job_application_controller.dart';
import 'package:placement_app/presentation/tpo/schedul_interview_screen/controller/interview_controller.dart';
import 'package:placement_app/presentation/tpo/tpo_login_screen/controller/tpo_login_controller.dart';
import 'package:placement_app/presentation/tpo/tpo_manager_student_screen/controller/tpo_manage_student_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => CompanyLoginController()),
    ChangeNotifierProvider(create: (context) => StudentLoginController()),
    ChangeNotifierProvider(create: (context) => TPOLoginController()),
    ChangeNotifierProvider(
        create: (context) => StudentBottomNavigationController()),
    ChangeNotifierProvider(create: (context) => CompanyBottomController()),
    ChangeNotifierProvider(
        create: (context) => TPOBottomNavigationController()),
    ChangeNotifierProvider(create: (context) => StudentRegController()),
    ChangeNotifierProvider(create: (context) => TpoRegisterController()),
    ChangeNotifierProvider(create: (context) => CompanyRegisterController()),
    ChangeNotifierProvider(create: (context) => TPOManageStudentController()),
    ChangeNotifierProvider(create: (context) => ApplicationRecivedController()),
    ChangeNotifierProvider(create: (context) => JobsPostedController()),
    ChangeNotifierProvider(create: (context) => TPOManageCompanyController()),
    ChangeNotifierProvider(create: (context) => PostJobController()),
    ChangeNotifierProvider(create: (context) => ApplyJobsController()),
    ChangeNotifierProvider(create: (context) => TPOManageJobController()),
    ChangeNotifierProvider(create: (context) => InterviewScheduleController()),
    ChangeNotifierProvider(create: (context) => InterviewStatusController()),
    ChangeNotifierProvider(create: (context) => InterviewController()),
    ChangeNotifierProvider(create: (context) => ApplicationStatusController()),
    // ChangeNotifierProvider(create: (context) => ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
