import 'package:flutter/material.dart';
import 'package:placement_app/core/constants/color_constants.dart';
import 'package:placement_app/presentation/tpo/bottom_navigation_screen/controller/bottom_navigation_controller.dart';
import 'package:placement_app/presentation/tpo/manage_company_screen/view/manage_company_screen.dart';
import 'package:placement_app/presentation/tpo/manage_job_req_screen/view/manage_request_screen.dart';
import 'package:placement_app/presentation/tpo/schedul_interview_screen/view/interview_scrn.dart';
import 'package:placement_app/presentation/tpo/tpo_manager_student_screen/view/tpo_manage_student.dart';
import 'package:provider/provider.dart';

class TPOBottomNavigationScreen extends StatelessWidget {
  const TPOBottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TPOBottomNavigationController>(
          builder: (context, controller, _) {
        return IndexedStack(
          index: controller.currentIndex,
          children:  [
            TPOManageStudentScreen(),
            TPOManageCompanyScreen(),
            TPOManageJobScreen(),
            InterviewScheduleScreen()
          ],
        );
      }),
      bottomNavigationBar: Consumer<TPOBottomNavigationController>(
          builder: (context, controller, _) {
        return Container(
          padding:  EdgeInsets.all(5),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.blueGrey),
          child: BottomNavigationBar(
              backgroundColor: Colors.blueGrey,
              currentIndex: controller.currentIndex,
              elevation: 0,
              onTap: (index) {
                controller.currentIndex = index;
              },
              selectedIconTheme: const IconThemeData(
                color: Colors.white,
                size: 25,
              ),
              unselectedIconTheme: const IconThemeData(
                size: 25,
              ),
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.white,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    backgroundColor: ColorTheme.primary,
                    label: "Manage Student"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.domain), label: "Manage Company"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.contact_page), label: "Manage Request"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.timer), label: "Interview"),
              ]),
        );
      }),
    );
  }
}
