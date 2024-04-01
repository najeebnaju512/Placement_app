import 'package:flutter/material.dart';
import 'package:placement_app/core/constants/color_constants.dart';
import 'package:placement_app/presentation/students/apply_jobs_screen/view/apply_jobs_screen.dart';
import 'package:placement_app/presentation/students/bottom_navigation_screen/controller/student_bottom_navigation_controller.dart';
import 'package:placement_app/presentation/students/interview/view/interview_screen.dart';
import 'package:placement_app/presentation/students/applicatioon_status/view/application_status.dart';
import 'package:provider/provider.dart';

class StudentBottomNavigationScreen extends StatelessWidget {
  const StudentBottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<StudentBottomNavigationController>(
          builder: (context, controller, _) {
        return IndexedStack(
          children: [
            InterviewStatusScrn(),
            ApplyJobScreen(),
            ApplicationStatus()
          ],
          index: controller.currentIndex,
        );
      }),
      bottomNavigationBar: Consumer<StudentBottomNavigationController>(
          builder: (context, controller, _) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ColorTheme.primary),
            child: BottomNavigationBar(
                selectedIconTheme: IconThemeData(color: ColorTheme.white),
                elevation: 0,
                backgroundColor: ColorTheme.primary,
                onTap: (index) {
                  controller.currentIndex = index;
                },
                currentIndex: controller.currentIndex,
                type: BottomNavigationBarType.fixed,
                unselectedItemColor: ColorTheme.grey,
                selectedItemColor: ColorTheme.white,
                showSelectedLabels: true,
                showUnselectedLabels: false,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.menu_book_sharp), label: "Interview"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.add), label: "Apply"),
                  BottomNavigationBarItem(icon: Icon(Icons.quiz), label: "Applied Job")
                ]),
          ),
        );
      }),
    );
  }
}
