import 'package:flutter/material.dart';
import 'package:placement_app/config/app_config.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/global_text_styles.dart';
import '../../../common/get started scrn/get_started.dart';
import '../controller/bottom_navigation_controller.dart';

class CompanyBottomNavigationScreen extends StatefulWidget {
  const CompanyBottomNavigationScreen({super.key});

  @override
  State<CompanyBottomNavigationScreen> createState() =>
      _CompanyBottomNavigationScreenState();
}

class _CompanyBottomNavigationScreenState
    extends State<CompanyBottomNavigationScreen> {
  //int index = 0;
  //var screen =[home_page(),Trainer(),memberlist(),Equipment()];
  late SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            // UserAccountsDrawerHeader(
            //     decoration: BoxDecoration(color: Colors.blueGrey),
            //     currentAccountPicture: CircleAvatar(
            //       child: Icon(Icons.person_rounded),
            //       backgroundColor: Colors.white,
            //     ),
            //     accountName: Text("Name", style: GLTextStyles.labeltxtBlk20),
            //     accountEmail: Text("")),
            // ListTile(
            //   leading: Icon(Icons.person),
            //   title: Text("Profile",  style: GLTextStyles.labeltxtBlk18,),
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => ProfileScreenView()));
            //   },
            // ),TODO

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
      body: Provider.of<CompanyBottomController>(context)
          .screens[Provider.of<CompanyBottomController>(context).selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.blueGrey),
          child: BottomNavigationBar(
              backgroundColor: Colors.blueGrey,
              currentIndex:
                  Provider.of<CompanyBottomController>(context).selectedIndex,
              onTap:
                  Provider.of<CompanyBottomController>(context, listen: false)
                      .onItemTap,
              elevation: 0,
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
                    backgroundColor: Colors.blueGrey,
                    icon: Icon(Icons.home),
                    label: "Application"),
                BottomNavigationBarItem(
                    backgroundColor: Colors.blueGrey,
                    icon: Icon(Icons.post_add),
                    label: "Post Job"),
                BottomNavigationBarItem(
                    backgroundColor: Colors.blueGrey,
                    icon: Icon(Icons.list),
                    label: "Job"),
                BottomNavigationBarItem(
                    backgroundColor: Colors.blueGrey,
                    icon: Icon(Icons.person),
                    label: "Interviews"),
              ]),
        ),
      ),
    );
  }

  logout() async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(AppConfig.companyLoggedIn, false);
  }
}
