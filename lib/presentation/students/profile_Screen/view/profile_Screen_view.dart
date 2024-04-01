import 'package:flutter/material.dart';
import 'package:placement_app/core/constants/global_text_styles.dart';
import 'package:placement_app/global_widget/student_appbar.dart';

class ProfileScreenView extends StatefulWidget {
  const ProfileScreenView({super.key});

  @override
  State<ProfileScreenView> createState() => _ProfileScreenViewState();
}

class _ProfileScreenViewState extends State<ProfileScreenView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: StudentAppBar(
        title: "Profile",
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 35, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name", style: GLTextStyles.titleStyle26),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(Icons.person_pin),
                SizedBox(
                  width: 6,
                ),
                Text("username", style: GLTextStyles.titleStyle),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(Icons.email),
                SizedBox(
                  width: 6,
                ),
                Text("abc@gmail.com", style: GLTextStyles.titleStyle),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(Icons.phone),
                SizedBox(
                  width: 6,
                ),
                Text("9898989898", style: GLTextStyles.titleStyle),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Text("Resume", style: GLTextStyles.labeltxtBlk20),
            InkWell(
              child: Container(
                height: size.height * .12,
                width: size.width * .8,
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 6,
                      ),
                      Text("Upload Resume", style: GLTextStyles.labeltxtBlk16),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            size: 17,
                          ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
