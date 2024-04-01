import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:placement_app/presentation/common/registration/company/controller/company_register_controller.dart';
import 'package:placement_app/presentation/company/company_login_screen/view/company_login_screen.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/color_constants.dart';
import '../../../../../core/constants/global_text_styles.dart';
import '../../../../../global_widget/image_icon_button.dart';
import '../../../../../global_widget/textformfield/mytextformfiled.dart';

class CompanyRegistration extends StatefulWidget {
  const CompanyRegistration({super.key});

  @override
  State<CompanyRegistration> createState() => _CompanyRegistrationState();
}

class _CompanyRegistrationState extends State<CompanyRegistration> {
  File? image;
  var usernameControl = TextEditingController();
  var nameControl = TextEditingController();
  var descripControl = TextEditingController();
  var industryControl = TextEditingController();
  var phoneControl = TextEditingController();
  var mailControl = TextEditingController();
  var locControl = TextEditingController();
  var yearControl = TextEditingController();
  var webControl = TextEditingController();
  var passControl = TextEditingController();

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

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
                  hintText: 'Company Name',
                  labelText: "Company Name",
                  controller: nameControl,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFieldScreen(
                  prefixIcon: Icon(Icons.phone_android),
                  hintText: 'Description',
                  labelText: "Description",
                  controller: descripControl,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFieldScreen(
                  prefixIcon: Icon(Icons.location_city_outlined),
                  hintText: 'Industry',
                  labelText: "Industry",
                  controller: industryControl,
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
                  prefixIcon: Icon(Icons.location_city),
                  hintText: 'Location',
                  labelText: "Location",
                  controller: locControl,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFieldScreen(
                  prefixIcon: Icon(Icons.date_range),
                  hintText: 'Since',
                  labelText: "Since",
                  controller: yearControl,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ImageIconButton(
                      width: width * .35,
                      height: size.height * .06,
                      onPressed: () => _getImage(ImageSource.camera),
                      icon: Icons.camera_alt_outlined,
                      label: 'Camera',
                    ),
                    ImageIconButton(
                      width: width * .35,
                      height: size.height * .06,
                      onPressed: () => _getImage(ImageSource.gallery),
                      icon: Icons.photo,
                      label: 'Gallery',
                    ),
                  ],
                ),
                if (image != null)
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    height: 200,
                    width: 200,
                    child: Image.file(
                      image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                TextFieldScreen(
                  prefixIcon: Icon(Icons.link),
                  hintText: 'website',
                  labelText: "website",
                  controller: webControl,
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
                      Provider.of<CompanyRegisterController>(context,
                              listen: false)
                          .onRegister(
                              context,
                              image,
                              usernameControl.text,
                              nameControl.text,
                              descripControl.text,
                              industryControl.text,
                              phoneControl.text,
                              mailControl.text,
                              locControl.text,
                              yearControl.text,
                              webControl.text,
                              passControl.text);
                      usernameControl.clear();
                      nameControl.clear();
                      descripControl.clear();
                      industryControl.clear();
                      phoneControl.clear();
                      mailControl.clear();
                      locControl.clear();
                      yearControl.clear();
                      webControl.clear();
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
                            builder: (context) => CompanyLoginScreen()));
                  },
                  child: RichText(
                      text: TextSpan(
                          style: TextStyle(color: Colors.black, fontSize: 16),
                          children: [
                        TextSpan(text: "Already registered?  "),
                        TextSpan(
                            text: "Login",
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
