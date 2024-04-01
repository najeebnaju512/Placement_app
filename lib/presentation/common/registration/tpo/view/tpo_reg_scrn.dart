import 'package:flutter/material.dart';
import 'package:placement_app/presentation/tpo/tpo_login_screen/view/tpo_login_screen.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/color_constants.dart';
import '../../../../../core/constants/global_text_styles.dart';
import '../../../../../global_widget/textformfield/mytextformfiled.dart';
import '../controller/tpo_register_controller.dart';

class TpoRegistration extends StatefulWidget {
  const TpoRegistration({super.key});

  @override
  State<TpoRegistration> createState() => _TpoRegistrationState();
}

class _TpoRegistrationState extends State<TpoRegistration> {
  var usernameControl = TextEditingController();
  var nameControl = TextEditingController();
  var phoneControl = TextEditingController();
  var mailControl = TextEditingController();
  var passControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Enter Valid Credentials",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFieldScreen(
                  prefixIcon: Icon(Icons.person_2_outlined),
                  hintText: 'username',
                  labelText: "username",
                  controller: usernameControl,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFieldScreen(
                  prefixIcon: Icon(Icons.person_2_rounded),
                  hintText: 'Name',
                  labelText: "Name",
                  controller: nameControl,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFieldScreen(
                  prefixIcon: Icon(Icons.phone_android),
                  hintText: 'Phone Number',
                  labelText: "Phone number",
                  controller: phoneControl,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFieldScreen(
                  prefixIcon: Icon(Icons.mail),
                  hintText: 'Email',
                  labelText: "Email",
                  controller: mailControl,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFieldScreen(
                  prefixIcon: Icon(Icons.visibility_off),
                  hintText: 'Password',
                  labelText: "password",
                  controller: passControl,
                ),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                    onPressed: () {
                      Provider.of<TpoRegisterController>(context, listen: false)
                          .onRegister(
                        context,
                        usernameControl.text,
                        nameControl.text,
                        phoneControl.text,
                        mailControl.text,
                        passControl.text,
                      );
                      usernameControl.clear();
                      nameControl.clear();
                      phoneControl.clear();
                      mailControl.clear();
                      passControl.clear();
                    },
                    minWidth: width * .5,
                    height: width * .15,
                    color: ColorTheme.darkClr,
                    textColor: ColorTheme.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        "Register",
                        style: GLTextStyles.labeltxt24,
                      ),
                    )),
                SizedBox(
                  height: 8,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TPOLoginScreen()));
                  },
                  child: RichText(
                      text: TextSpan(
                          style: TextStyle(color: Colors.black, fontSize: 16),
                          children: [
                        TextSpan(text: "Already registered?  "),
                        TextSpan(
                            text: "Login Here",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF568896)))
                      ])),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
