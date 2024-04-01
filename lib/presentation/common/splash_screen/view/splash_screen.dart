import 'dart:async';

import 'package:flutter/material.dart';
import 'package:placement_app/config/app_config.dart';
import 'package:placement_app/core/constants/global_text_styles.dart';
import 'package:placement_app/presentation/common/get%20started%20scrn/get_started.dart';
import 'package:placement_app/presentation/company/bottom_navigation_screen/view/company_bottom_navigation_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../students/bottom_navigation_screen/view/student_bottom_navigation_screen.dart';
import '../../../tpo/bottom_navigation_screen/view/bottom_navigation_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SharedPreferences sharedPreferences;
  late bool checkCompanyLoggedIn;
  late bool checkStudentLoggedIn;
  late bool checkTPOLoggedIn;

  Future<void> checkUserRegistered() async {
    sharedPreferences = await SharedPreferences.getInstance();
    checkCompanyLoggedIn = sharedPreferences.getBool(AppConfig.companyLoggedIn) ?? false;
    checkStudentLoggedIn = sharedPreferences.getBool(AppConfig.studentLoggedIn) ?? false;
    checkTPOLoggedIn = sharedPreferences.getBool(AppConfig.tpoLoggedIn) ?? false;
  }

  @override
  void initState() {
    checkUserRegistered().then((value) {
      if (checkCompanyLoggedIn) {
        Timer(Duration(seconds: 4), () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CompanyBottomNavigationScreen()));
        });
      } else if (checkStudentLoggedIn) {
        Timer(Duration(seconds: 4), () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StudentBottomNavigationScreen()));
        });
      } else if (checkTPOLoggedIn) {
        Timer(Duration(seconds: 4), () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TPOBottomNavigationScreen()));
        });
      } else {
        Timer(Duration(seconds: 4), () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => GetStarted()));
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(height: 125, "asset/logo/placementlogo.png"),
            Text(
              "Placement & Training App",
              style: GLTextStyles.labeltxtBlk18,
            )
          ],
        ),
      ),
    );
  }
}
