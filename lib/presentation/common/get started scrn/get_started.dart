import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:placement_app/core/constants/color_constants.dart';
import 'package:placement_app/core/constants/global_text_styles.dart';
import 'package:placement_app/global_widget/global_meterial_btn.dart';
import 'package:placement_app/presentation/common/registration/company/view/company_reg_scrn.dart';
import 'package:placement_app/presentation/common/registration/student/view/student_register_scrn.dart';
import 'package:placement_app/presentation/common/registration/tpo/view/tpo_reg_scrn.dart';

import '../student_company_login/student_company.dart';



class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color(0xFFeef1f3),
            appBar: AppBar(
              backgroundColor: const Color(0xFFeef1f3),
              actions: [
                PopupMenuButton(
                    iconSize: 20,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    icon: Icon(Icons.more_vert),
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TpoRegistration(),
                                ));
                          },
                          child: Text(
                            "Training & Placement Officer",
                            style: GLTextStyles.labeltxtBlk16,
                          ),
                        ),
                      ];
                    })
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Get Registered Here",
                    style: GoogleFonts.poppins(
                      fontSize: 26.0,
                      fontWeight: FontWeight.w700,
                      color: ColorTheme.black,
                    ),
                  ),
                  LottieBuilder.asset("asset/animation/getStarted.json"),
                  SizedBox(
                    height: 10,
                  ),
                  GLMetrialButton(
                    text: "Login Here",
                    color: ColorTheme.darkClr,
                    txtClr: ColorTheme.white,
                    height: width * .15,
                    route: StudentCompany(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GLMetrialButton(
                    text: "Student",
                    color: ColorTheme.darkClr,
                    txtClr: ColorTheme.white,
                    height: width * .15,
                    route: StudentRegister(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GLMetrialButton(
                    text: "Company",
                    color: ColorTheme.darkClr,
                    txtClr: ColorTheme.white,
                    height: width * .15,
                    route: CompanyRegistration(),
                  ),
                ],
              ),
            )));
  }
}
