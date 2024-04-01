import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:placement_app/config/app_config.dart';
import 'package:placement_app/core/utils/app_utils.dart';
import 'package:placement_app/presentation/common/student_company_login/student_company.dart';

class CompanyRegisterController extends ChangeNotifier {
  Future<void> onRegister(
      BuildContext context,
      File? image,
      String username,
      String name,
      String descrption,
      String industry,
      String phone,
      String mail,
      String location,
      String year,
      String website,
      String pass) async {
    try {
      // Upload image
      var imageUrl = "${AppConfig.baseurl}company/signup/";
      onUploadImage(imageUrl, image, username, name, descrption, industry,
              phone, mail, location, year, website, pass)
          .then(
        (response) {
          log("${response.statusCode}");
          if (response.statusCode == 200) {
            // var decodedData = jsonDecode(response.body);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => StudentCompany()));
          } else {
            // Handle error in API response
            var message = jsonDecode(response.body)["msg"];
            AppUtils.oneTimeSnackBar(message, context: context);
          }
        },
      );
    } catch (e) {
      // Handle any exceptions
      print("Error occurred: $e");
    }
  }

  Future<http.Response> onUploadImage(
    String url,
    File? selectedImage,
    String username,
    String name,
    String descrption,
    String industry,
    String phone,
    String mail,
    String location,
    String year,
    String website,
    String pass,
  ) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    Map<String, String> headers = {"Content-type": "multipart/form-data"};

    if (selectedImage != null) {
      print("Image file size: ${selectedImage.lengthSync()} bytes <<<<<<<<<<<");
      // var request = http.MultipartRequest('POST', Uri.parse(url));

      // Add image file to the request
      request.files.add(
        await http.MultipartFile.fromPath(
          'logo',
          selectedImage.path,
        ),
      );
    }

    request.fields['name'] = name;
    request.fields['description'] = descrption;
    request.fields['industry'] = industry;
    request.fields['email_address'] = mail;
    request.fields['phone_no'] = phone;
    request.fields['Headquarters'] = location;
    request.fields['founded'] = year;
    request.fields['website'] = website;
    request.fields['username'] = username;
    request.fields['password'] = pass;

    request.headers.addAll(headers);
    print("request: " + request.toString());
    var res = await request.send();
    return await http.Response.fromStream(res);
  }
}
