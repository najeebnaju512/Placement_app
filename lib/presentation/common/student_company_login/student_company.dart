import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:placement_app/core/constants/color_constants.dart';
import 'package:placement_app/presentation/company/company_login_screen/view/company_login_screen.dart';
import 'package:placement_app/presentation/students/student_login_screen/view/student_login_screen.dart';

import '../../../global_widget/global_meterial_btn.dart';

class StudentCompany extends StatelessWidget {
  const StudentCompany({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color(0xFFeef1f3),
            appBar: AppBar(
              backgroundColor: const Color(0xFFeef1f3),
            ),
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text(
                  //   "Get Registered Here",
                  //   style: GoogleFonts.poppins(
                  //     fontSize: 26.0,
                  //     fontWeight: FontWeight.w700,
                  //     color: ColorTheme.black,
                  //   ),
                  // ),
                  LottieBuilder.asset("asset/animation/getStarted.json"),
                  SizedBox(
                    height: 10,
                  ),
                  GLMetrialButton(
                    text: "Login as Student",
                    color: ColorTheme.darkClr,
                    txtClr: ColorTheme.white,
                    height: width * .15,
                    route: StudentLoginScreen(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GLMetrialButton(
                    text: "Login as Company",
                    color: ColorTheme.darkClr,
                    txtClr: ColorTheme.white,
                    height: width * .15,
                    route: CompanyLoginScreen(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )));
  }
}
