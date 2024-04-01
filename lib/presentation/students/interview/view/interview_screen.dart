import 'package:flutter/material.dart';
import 'package:placement_app/core/constants/global_text_styles.dart';
import 'package:placement_app/global_widget/student_appbar.dart';
import 'package:placement_app/presentation/common/get%20started%20scrn/get_started.dart';
import 'package:placement_app/presentation/students/interview/controller/interview_controller.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../config/app_config.dart';
import '../../../../core/constants/color_constants.dart';

class InterviewStatusScrn extends StatefulWidget {
  const InterviewStatusScrn({super.key});

  @override
  State<InterviewStatusScrn> createState() => _InterviewStatusScrnState();
}

class _InterviewStatusScrnState extends State<InterviewStatusScrn> {
  late SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Scaffold(
          appBar: StudentAppBar(
            title: "Interview",
          ),
          drawer: Drawer(
            backgroundColor: Colors.white,
            child: ListView(
              children: [
                // UserAccountsDrawerHeader(
                //     decoration: BoxDecoration(color: Colors.blueGrey),
                //     currentAccountPicture: Center(
                //       child: CircleAvatar(
                //         child: Icon(Icons.person_rounded),
                //         backgroundColor: Colors.white,
                //       ),
                //     ),
                //     accountName:
                //         Text("", style: GLTextStyles.labeltxtBlk20),
                //     accountEmail: Text("")
                //     ),
                // ListTile(
                //   leading: Icon(Icons.person),
                //   title: Text(
                //     "Profile",
                //     style: GLTextStyles.labeltxtBlk18,
                //   ),
                //   onTap: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => ProfileScreenView()));
                //   },
                // ),
                ListTile(
                  leading: Icon(Icons.library_books_rounded),
                  title: Text("Academic Details",
                      style: GLTextStyles.labeltxtBlk18),
                ),
                ListTile(
                  leading: Icon(Icons.file_copy),
                  title: Text("Project Details",
                      style: GLTextStyles.labeltxtBlk18),
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings", style: GLTextStyles.labeltxtBlk18),
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text("Logout", style: GLTextStyles.labeltxtBlk18),
                  onTap: () {
                    logout();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => GetStarted()),
                        (route) => false);
                  },
                ),
              ],
            ),
          ),
          body: FutureBuilder(
              future: Provider.of<InterviewController>(context, listen: false)
                  .fetchData(context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return Consumer<InterviewController>(
                    builder: (context, iControl, child) {
                      return iControl.interviewModel.data == null ||
                      iControl.interviewModel.data!.isEmpty ? Center(
                        child: Text(
                          "No Data Found",
                          style: TextStyle(
                              color: ColorTheme.red,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ):ListView.builder(
                          itemCount: iControl.interviewModel.data?.length,
                          itemBuilder: (context, index) {
                            return Card(
                                child: ListTile(
                                  title: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "Date : ${iControl.interviewModel.data?[index].dateTime}"),
                                      Text(
                                          "Place : ${iControl.interviewModel.data?[index].location}")
                                    ],
                                  ),
                                  subtitle: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "Application Id : ${iControl.interviewModel.data?[index].application}"),
                                      Text(
                                          "Company Id : ${iControl.interviewModel.data?[index].company}")
                                    ],
                                  ),
                                ));
                          });
                    },
                  );
                }
              })),
    );
  }

  logout() async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(AppConfig.studentLoggedIn, false);
  }
}
