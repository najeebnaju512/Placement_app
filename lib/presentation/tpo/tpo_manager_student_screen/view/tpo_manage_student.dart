import 'package:flutter/material.dart';
import 'package:placement_app/core/constants/color_constants.dart';
import 'package:placement_app/presentation/tpo/tpo_manager_student_screen/controller/tpo_manage_student_controller.dart';
import 'package:placement_app/presentation/tpo/tpo_manager_student_screen/view/widget/tpo_user_card.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../config/app_config.dart';
import '../../../common/get started scrn/get_started.dart';

class TPOManageStudentScreen extends StatefulWidget {
  const TPOManageStudentScreen({super.key});

  @override
  State<TPOManageStudentScreen> createState() => _TPOManageStudentScreenState();
}

class _TPOManageStudentScreenState extends State<TPOManageStudentScreen> {
  late SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Students"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: () {
                  logout();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => GetStarted()),
                      (route) => false);
                },
                icon: Icon(Icons.logout_rounded)),
            SizedBox(
              width: 10,
            )
          ],
        ),
        // drawer: Drawer(child: Consumer<TPOManageStudentController>(
        //   builder: (context, tControl, child) {
        //     return ListView(
        //       children: [
        //         UserAccountsDrawerHeader(
        //             decoration: BoxDecoration(color: Colors.blueGrey),
        //             accountName: Text("${tControl.name}"),
        //             accountEmail: Text("${tControl.mail}")),
        //         ListTile(
        //           leading: Icon(Icons.logout),
        //           title: Text("Logout"),
        //           onTap: () {
        //             Navigator.pushAndRemoveUntil(
        //                 context,
        //                 MaterialPageRoute(builder: (context) => GetStarted()),
        //                 (route) => false);
        //           },
        //         )
        //       ],
        //     );
        //   },
        // )),
        body: FutureBuilder(
            future:
                Provider.of<TPOManageStudentController>(context, listen: false)
                    .fetchStudentList(context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return Consumer<TPOManageStudentController>(
                  builder: (context, tmsControl, child) {
                    return tmsControl.tpoManageStudentModel.data == null ||
                            tmsControl.tpoManageStudentModel.data!.isEmpty
                        ? Center(
                            child: Text(
                              "No Data Found",
                              style: TextStyle(
                                  color: ColorTheme.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: ListView.builder(
                              itemCount:
                                  tmsControl.tpoManageStudentModel.data?.length,
                              itemBuilder: (BuildContext context, int index) {
                                return TPOStudentCard(
                                  fullName:
                                      "${tmsControl.tpoManageStudentModel.data?[index].firstName} ${tmsControl.tpoManageStudentModel.data?[index].lastName}",
                                  phone:
                                      "${tmsControl.tpoManageStudentModel.data?[index].phoneNo}",
                                  username:
                                      '${tmsControl.tpoManageStudentModel.data?[index].username}',
                                  email:
                                      '${tmsControl.tpoManageStudentModel.data?[index].emailAddress}',
                                );
                              },
                            ),
                          );
                  },
                );
              }
            }));
  }

  logout() async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(AppConfig.studentLoggedIn, false);
  }
}
